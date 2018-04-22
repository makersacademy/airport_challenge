require 'spec_helper'

RSpec.feature "Air traffic controller" do
  let(:weather) { instance_double("Weather", :stormy? => false) }
  let(:airport) { Airport.new(weather_forecast: weather) }
  let(:planes) { Array.new(5) { Plane.new } }

  def new_airport
    Airport.new(weather_forecast: weather)
  end

  scenario "Lands 5 planes at an airport" do
    expect(airport.capacity).to eq Airport::DEFAULTS[:capacity]
    planes.each do |plane|
      airport.land(plane)
    end
    expect(airport.planes).to eq planes
  end

  scenario "Won't let a plane land when airport is full" do
    airport.capacity = 5
    expect(airport.capacity).to eq 5
    planes.each do |plane|
      airport.land(plane)
    end
    expect { airport.land(Plane.new) }.to raise_error(AirportError, "Airport full")
  end

  scenario "Airport won't allow landing or take off when weather is stormy" do
    plane_1, plane_2 = planes.pop, planes.pop
    airport.land(plane_1)
    expect(airport.planes).to contain_exactly plane_1
    expect(plane_1.location?).to eq airport
    allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.land(plane_2) }.to raise_error(AirportError, "Weather is stormy, cannot land.")
    expect { airport.release(plane_1) }.to raise_error(AirportError, "Weather is stormy, cannot take off.")
  end

  scenario "Takes off and lands planes" do
    plane_1, plane_2 = planes.pop, planes.pop
    airport_1, airport_2 = new_airport, new_airport
    airport_1.land(plane_1)
    airport_2.land(plane_2)
    expect(plane_1.flying?).to be false
    expect(plane_2.flying?).to be false
    expect(plane_1.location?).to be airport_1
    expect(plane_2.location?).to be airport_2
    expect(airport_1.planes).to include plane_1
    expect(airport_2.planes).to include plane_2
    airport_2.release(plane_2)
    expect(plane_2.flying?).to be true
    expect(plane_2.location?).to eq "In-flight"
    expect(airport_2.planes).not_to include plane_2
    airport_1.land(plane_2)
    expect(plane_2.flying?).to be false
    expect(plane_2.location?).to be airport_1
    expect(airport_1.planes).to contain_exactly(plane_1, plane_2 )
  end

  scenario "Won't let a plane take off from another airport or when it is already in the air" do
    plane = planes.pop
    airport_1, airport_2 = new_airport, new_airport
    expect { airport_1.release(plane) }.to raise_error(PlaneError, "Plane already in-flight")
    airport_1.land(plane)
    expect { airport_2.release(plane) }.to raise_error(AirportError, "Plane not in current airport")
  end

  scenario "Won't let a plane land when already landed" do
    plane = planes.pop
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error(PlaneError, "Plane already on the ground")
  end

end

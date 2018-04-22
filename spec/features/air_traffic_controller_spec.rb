require 'spec_helper'

RSpec.feature "Air traffic controller" do
  let(:airport) { Airport.new }
  let(:planes) { Array.new(5) { Plane.new } }

  scenario "Lands 5 planes at an airport" do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.capacity).to eq Airport::DEFAULTS[:capacity]
    planes.each do |plane|
      airport.land(plane)
    end
    expect(airport.planes).to eq planes
  end

  scenario "Won't let a plane land when airport is full" do
    airport.capacity = 5
    expect(airport.capacity).to eq 5
    allow(airport).to receive(:stormy?).and_return(false)
    planes.each do |plane|
      airport.land(plane)
    end
    expect { airport.land(Plane.new) }.to raise_error(AirportError, "Airport full")
  end

  scenario "Airport won't allow landing or take off when weather is stormy" do
    allow(airport).to receive(:stormy?).and_return(false)
    plane_1 = planes.pop
    plane_2 = planes.pop
    airport.land(plane_1)
    expect(airport.planes).to contain_exactly plane_1
    expect(plane_1.location?).to eq airport
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane_2) }.to raise_error(AirportError, "Weather is stormy, cannot land.")
    expect { airport.release(plane_1) }.to raise_error(AirportError, "Weather is stormy, cannot take off.")
  end
end

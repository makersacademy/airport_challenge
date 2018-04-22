require './spec/spec_helper.rb'

RSpec.feature "Air Traffic Controller" do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { double :weather, stormy?: false }
  before { allow(Weather).to receive(:new).and_return(weather) }
  # airport = Airport.new
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  scenario "Plane lands in airport" do
    expect(airport.land(plane)).to eq airport.planes
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  scenario "Plane takes off airport" do
    airport.land(plane)
    airport.planes << plane
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  scenario "Prevent takes off due to stormy weather" do
    airport.land(plane)
    allow(weather).to receive(:stormy?) { true }
    expect { airport.take_off(plane)
    }.to raise_error "Can't take off: Bad weather conditions!"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  scenario "Prevent landing due to stormy weather" do
    allow(weather).to receive(:stormy?) { true }
    expect { airport.land(plane)
    }.to raise_error "Can't land: Bad weather conditions!"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  scenario "Prevent landing when full default capacity" do
    airport.land(Plane.new)
    airport.land(Plane.new)
    expect { airport.land(plane)
    }.to raise_error "Can't land: Airport is full!"
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  scenario "Allow overriding of default capacity" do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end

  # Edge cases

  # As the system designer
  # So that the software is robust
  # Planes can only take off from the airport they are in

  scenario "Plane tries to takes off from wrong airport" do
    airport.land(plane)
    airport2 = Airport.new
    expect { airport2.take_off(plane)
    }.to raise_error "Plane is not landed in this airport!"
  end

  # As the system designer
  # So that the software is robust
  # Planes that are already in airport cannot land in it again

  scenario "Plane cannot land again if it is already landed" do
    airport.land(plane)
    expect { airport.land(plane)
    }.to raise_error "Plane is already landed in this airport!"
  end

  # As the system designer
  # So that the software is robust
  # Planes already in air cannot take off again

  scenario "Plane cannot take off if already in air!" do
    airport.land(plane)
    airport.take_off(plane)
    expect { plane.take_off
    }.to raise_error "Plane is already in air!"
  end

  scenario "Lands and takes off a number of planes" do
    planes = [Plane.new, Plane.new]
    planes.each { |plane| airport.land(plane) }
    expect(airport.planes).to eq planes
    planes.each { |plane| airport.take_off(plane) }
    expect(airport.planes).to eq []
  end

end

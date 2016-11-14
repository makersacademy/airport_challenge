require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed

  it 'instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.instructs_landing(plane)).to eq true
    end

  it 'confirms a plane has landed' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.confirms_landing(plane)).to eq true
    end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it 'instructs a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.instructs_takeoff(plane)).to eq true
    end

  it 'confirms that a plane has taken off' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.confirms_takeoff(plane)).to eq true
    end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  it 'prevents landing when the airport is full' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.cannot_land(plane) }.to raise_error "Cannot land as airport is full"
    end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate


end

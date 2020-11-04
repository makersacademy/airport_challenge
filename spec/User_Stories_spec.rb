require './lib/Airport'
require './lib/Plane'

describe 'User Stories' do
  it 'so planes land at airports, Instruct a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
  it 'so plane takes off from airport, instruct a plane to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off }.not_to raise_error
  end
  it 'When instructing a plane to land at a full airport, raise an error' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("Airport at full Capacity")
  end
  it 'Setting a default Capacity' do
    default_airport = Airport.new
    plane = Plane.new
    default_capacity = Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
    expect{ default_airport.land(plane) }.to raise_error("Airport at full Capacity")
  end
end

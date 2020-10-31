require './lib/Airport'
require './lib/Plane'

describe 'User Stories' do
  it 'so planes land at airports, Instruct a plane to land' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
  end
  it 'so plane takes off from airport, instruct a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect{ airport.take_off(plane) }.not_to raise_error
  end
end

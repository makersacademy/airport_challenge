require 'airport'
require 'plane'
require 'weather'

describe 'air traffic controller' do
  it 'landing a plane in good weather' do
    weather = Weather.new(false)
    airport = Airport.new(20, weather)
    plane = Plane.new
    airport.arrive(plane)
    expect(plane).to be_grounded
    expect(airport.ground_fleet).to include(plane)
  end
end

require 'airport'
require 'plane'

describe 'plane takes off and plane removed from airport' do
  it 'removes plane from airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to be_empty
  end
end

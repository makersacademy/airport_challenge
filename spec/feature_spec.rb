require 'airport'
require 'plane'

describe 'airport challenge' do
  it 'lands a plane at an airport' do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
  end
end

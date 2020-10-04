require 'airport'
require 'plane'

describe Airport do
  it 'can land a plane at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to include plane
  end
end

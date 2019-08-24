require 'airport'
require 'plane'

describe Airport do

  it 'tracks a plane that is flying to it' do
    plane = Plane.new
    airport = Airport.new
    airport.track_plane(plane)
    expect(airport.planes).to include plane
  end

end

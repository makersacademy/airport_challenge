require 'airport'
require 'plane'

describe 'feature test' do
  it 'works' do
    airport = Airport.new
    plane = Plane.new
    airport.instruct_plane_to_land(plane)
  end
end
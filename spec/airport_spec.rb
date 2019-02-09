require 'airport.rb'

describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.planes).to equal plane
  end
end

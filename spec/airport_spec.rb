require 'airport.rb'

describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.planes).to include(plane)
  end

  it 'instructs a plane to take off and confirm that it is no longer in the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.take_off(plane)).to be plane
    expect(airport.planes).to be_empty
  end
end

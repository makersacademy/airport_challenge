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

  it 'should have a default capacity of 1 and raise error if asked to land more planes' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    another_plane = Plane.new
    expect { airport.land_plane(another_plane) }.to raise_error "The airport is full"

  end
end

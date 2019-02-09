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

  it 'should have a default capacity and raise error if asked to land more planes' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times do
      airport.land_plane(Plane.new)
    end
    expect { airport.land_plane(Plane.new) }.to raise_error "The airport is full"

  end

  it 'should be created with an override capacity if passed in and allow as many planes as its defined capacity to land ' do
    airport = Airport.new(2)
    plane = Plane.new
    airport.land_plane(plane)
    another_plane = Plane.new
    airport.land_plane(another_plane)
    expect(airport.planes).to include(plane)
    expect(airport.planes).to include(another_plane)
  end
end

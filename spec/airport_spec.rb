require 'airport'
require 'plane'

describe Airport do
  it '#land method lands a plane at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to include plane
  end

  it '#depart method departs a plane from an airport' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.depart(plane1)
    expect(airport.instance_variable_get(:@hangar).length).to eq 1
  end
end


# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# depart
#
# arr.pop(plane)
# #{plane} has left #{airport}

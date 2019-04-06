require 'airport'
require 'plane'

describe 'User stories' do
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
  it 'instruct a plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land_plane(plane) }.not_to raise_error
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
  it 'instructs a plane to take off from an airport' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
end




# and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

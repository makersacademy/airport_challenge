require 'plane'
require 'airport'

#These are the user stories:

#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport and confirm that it has landed

describe Airport do
it "so that planes can land at airports, instruct a plane to land" do
airport = Airport.new
plane = Plane.new
expect { airport.land(plane) }.not_to raise_error
end
end

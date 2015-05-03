require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"
require 'airport'
describe Plane do

   it 'has a flying status when not at an airport'do
   plane = Plane.new
   expect(plane).to be_flying
end

	it 'can be landed'do
	plane =Plane.new
  airport = Airport.new
  airport.land(plane)
	expect(plane).to be_flying

  end

  it 'changes its status to not flying after landing'do
  plane = Plane.new
  plane.land
  expect(plane).not_to be_flying
end



end

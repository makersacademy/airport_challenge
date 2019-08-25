require 'plane'

describe "air traffic control" do
	
	it "can land a plane" do
	airport = Airport.new
	plane = Plane.new
	airport.land(plane)
	expect(airport.hangar).to include(plane)
	end
end
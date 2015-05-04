require 'plane'
require 'airport'

describe Plane do

   it 'has a flying status when not at an airport'do
   plane = Plane.new
   expect(plane).to be_flying
end

	it 'can be landed'do
	plane =Plane.new
  airport = Airport.new
  airport.approves_landing(plane)
	expect(plane).to be_flying
  plane.landed
  expect(plane).not_to be_flying
end

  it 'changes its status to not flying after landing'do
  plane = Plane.new
  airport = Airport.new
  airport.approves_landing(plane)
  plane.landed
  expect(plane).not_to be_flying
end
  it 'changes its status to flying after take-off'do
  plane = Plane.new
  airport = Airport.new
  airport.approves_landing(plane)
  plane.landed
  airport.approves_take_off
  plane.take_off
  expect(plane).to be_flying
end

end

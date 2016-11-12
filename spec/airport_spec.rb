require "airport"

describe Airport do

it "should park a plane" do
  plane = Plane.new
  subject.planes << plane
  expect(subject.planes).to include(plane)
end

it "should instruct a plane to take off" do
  plane = Plane.new
  subject.taxi(plane)
  expect(subject.planes).not_to include(plane)
end

end

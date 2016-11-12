require "airport"

describe Airport do

it "should park a plane" do
  plane = Plane.new
  subject.planes << plane
  expect(subject.planes).to include(plane)
end

end

require "./lib/plane"

describe Plane do

it "has been identified" do
  plane = Plane.new
  expect(plane).to respond_to(:land)
end


end

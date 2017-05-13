require "plane.rb"

describe Plane do
it "should instruct a plane to land at the airport" do
  expect(subject).to respond_to(:land)
  end

it "should instruct a plane to take off from an airport and confirm that it is no longer in the airport" do
  expect(subject).to respond_to(:take_off)
  end
end

require "plane.rb"

describe Plane do
it "should instruct a plane to land at the airport and confirm it has" do
  plane = Plane.new
  expect(subject).to respond_to(:landing)
  end

it "should instruct a plane to take off from an airport and confirm that it is no longer in the airport" do
  expect(subject).to respond_to(:take_off)
  end
end

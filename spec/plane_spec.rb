require "plane.rb"

describe Plane do
it "should instruct a plane to land at the airport" do
  plane = Plane.new
  expect(subject).to respond_to(:landing)
  end
end

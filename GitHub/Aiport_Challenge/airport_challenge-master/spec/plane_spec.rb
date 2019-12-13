# User Stories:
# *I want to instruct a plane to land at an airport
# *I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# *I want to prevent landing when the airport is full

require "plane"

describe Plane do
  plane = Plane.new
  it "creates an instance of plane" do
    expect(plane).to be_kind_of(Plane)
  end
end

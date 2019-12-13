# User Stories:
# *I want to instruct a plane to land at an airport
# *I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# *I want to prevent landing when the airport is full

require "plane"

describe Plane do


  it "creates an instance of plane" do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it "should land at airport" do
    plane = Plane.new
    expect(plane).to respond_to(:land_plane)
  end

end

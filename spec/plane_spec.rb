require "plane"

describe Plane do
  it "is expected to be an instance of Plane" do
    plane = Plane.new(true)
    expect(plane).to be_instance_of Plane
  end
end

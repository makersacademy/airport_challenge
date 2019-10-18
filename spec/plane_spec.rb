require "plane"

describe Plane do
  let(:plane) { Plane.new }

  it "successfully instantiates the plane class" do
    expect(plane).to be_instance_of(Plane)
  end
end

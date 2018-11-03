require "plane"

describe Plane do
  it "expects Plane.new to create an instance of Plane" do
    expect(Plane.new).to be_a Plane
  end
end
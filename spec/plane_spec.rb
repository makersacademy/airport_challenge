require "plane"

describe Plane do
  it "creates a new instance of the class" do
    plane = Plane.new
    expect(plane).to be_a Plane
  end
  
end
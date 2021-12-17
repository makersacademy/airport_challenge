require "plane"

describe Plane do 
  it "can make a plane" do
    plane = Plane.new
    expect(plane).not_to be nil
  end
end

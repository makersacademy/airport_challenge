require './lib/plane'

describe Plane do

  # plane should be an instance of class plane
  it "plane is an instance of Plane class" do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end

  it "expect plane to respond to method land" do
    plane = Plane.new
    plane.land
    expect(plane).to respond_to(:land)
  end

end

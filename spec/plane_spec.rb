require './lib/plane'

describe Plane do
  it "makes an instance of the Plane class" do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end
end

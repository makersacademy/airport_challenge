require 'plane'
describe Plane do
  it "can create instance of itself" do
    plane = Plane.new
    expect(plane).to be_an_instance_of (Plane)
  end
end

require "Plane"
describe Plane do

  it "expects plane to be an instance of the Plane class" do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end 
end

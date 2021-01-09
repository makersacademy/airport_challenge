require "airport"
require "plane"

describe Airport do

  it "checks if a plane instance was created" do
    plane = Plane.new
    expect(plane).to respond_to(:ready_to_fly)
  end

  it "lands plane at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  
end
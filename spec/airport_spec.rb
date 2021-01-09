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

  it "checks it airport responds to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "checks if there are planes that have landed" do
    expect(subject).to respond_to(:plane)
  end
  
  describe "Plane has taken off" do 
    it "raises a fail if there is a plane after take off" do
      expect { subject.take_off }.to raise_error "Plane has taken off"
    end
  end

end
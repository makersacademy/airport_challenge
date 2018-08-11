require "airport"
require "plane"


describe Airport do

  it "allows a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "allows a plane to take off" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "confirms plane has gone when plane takes off" do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq "#{plane} has taken off"
  end
end

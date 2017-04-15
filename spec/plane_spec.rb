require 'plane'

describe Plane do

  it "lands plane" do
    expect(subject).to respond_to(:land)
  end

  it "checks if plane landed" do
    plane = Plane.new
    plane.land("jet")
    expect(plane).to be_landed
  end

  it "tells plane to take off" do
    expect(subject).to respond_to(:take_off)
  end
  it "checks if plane has taken off" do
    plane = Plane.new
    plane.land("jet")
    plane.take_off
    expect(plane).to be_departed
  end
end

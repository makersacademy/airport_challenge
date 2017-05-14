require 'plane'

describe Plane do
  it "responds to the land method" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end
  it "shows that land method confirms landing" do
    expect(subject.land).to eq "landed"
  end
  it "responds to the take_off method" do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end
  it "shows that take_off method confirms take-off" do
    expect(subject.take_off).to eq "airborne"
  end
  
end

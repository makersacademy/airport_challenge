require 'plane'
describe Plane do
  it "lands at an airport" do
    plane = Plane.new
    expect(plane.land).to eq "plane has landed"
  end
  it "takes off from an airport" do
    plane2 = Plane.new
    plane2.take_off
    expect(plane2.status).to eq "in the air"
  end
end

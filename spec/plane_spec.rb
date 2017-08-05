require 'plane'
require 'airport'
describe Plane do

  it "lands at an airport" do
    airport = double("airport", :full => false, :weather => "sunny")
    plane = Plane.new
    plane.land(airport)
    expect(plane.status).to eq "on the ground"
  end

  it "takes off from an airport" do
    airport2 = double("airport2", :weather => "sunny")
    plane2 = Plane.new(airport2)
    plane2.take_off
    expect(plane2.status).to eq "in the air"
  end

  it "does not take off from a stormy airport" do
    airport3 = double("airport3", :weather => "stormy")
    plane3 = Plane.new(airport3)
    plane3.take_off
    expect(plane3.status).to eq "on the ground"
  end

  it "does not land into a stormy airport" do
    airport4 = double("airport4", :weather => "stormy")
    plane4 = Plane.new
    plane4.land(airport4)
    expect(plane4.status).to eq "in the air"
  end

  it "does not land into a full airport" do
    airport5 = double("airport5", :full => true, :weather => "sunny" )
    plane5 = Plane.new
    plane5.land(airport5)
    expect(plane5.status).to eq "in the air"
  end

  it "raises an error when a flying plane tries to take off" do
    airport6 = double("airport6")
    plane6 = Plane.new
    expect{plane6.take_off}.to raise_error("already flying")
  end

  it "raises an error when a landed plane tries to land at same airport" do
    airport6 = double("airport6", :full => false, :weather => "sunny")
    plane6 = Plane.new(airport6)
    expect{plane6.land(airport6)}.to raise_error("already landed at this airport")
  end

  it "raises an error when a landed plane tries to land at another airport" do
    airport6 = double("airport6", :full => false, :weather => "sunny")
    airport7 = double("airport7", :full => false, :weather => "sunny")
    plane6 = Plane.new(airport6)
    expect{plane6.land(airport7)}.to raise_error("already landed at another airport")
  end

end

require 'plane'
require 'airport'
describe Plane do

  it "lands at an airport" do
    airport = double("airport", :planes => 50, :capacity => 100)
    airport.stub(:get_weather => :sunny, :receive_plane => :planes )
    plane = Plane.new
    plane.land(airport)
    expect(plane.status).to eq :on_the_ground
  end

  it "takes off from an airport" do
    airport2 = double("airport2")
    airport2.stub(:get_weather => :sunny, :remove_plane => :planes)
    plane2 = Plane.new(airport2)
    plane2.take_off(airport2)
    expect(plane2.status).to eq :in_the_air
  end

  it "does not take off from a stormy airport" do
    airport3 = double("airport3")
    airport3.stub(:get_weather => :stormy)
    plane3 = Plane.new(airport3)
    plane3.take_off(airport3)
    expect(plane3.status).to eq :on_the_ground
  end

  it "does not land into a stormy airport" do
    airport4 = double("airport4")
    airport4.stub(:get_weather => :stormy)
    plane4 = Plane.new
    plane4.land(airport4)
    expect(plane4.status).to eq :in_the_air
  end

  it "does not land into a full airport" do
    airport5 = double("airport5", :planes => 100, :capacity => 100)
    airport5.stub(:get_weather => :sunny)
    plane5 = Plane.new
    plane5.land(airport5)
    expect(plane5.status).to eq :in_the_air
  end

  it "raises an error when a flying plane tries to take off" do
    airport6 = double("airport6")
    airport6.stub(:get_weather => :sunny)
    plane6 = Plane.new
    expect{plane6.take_off(airport6)}.to raise_error("already flying")
  end

  it "raises an error when a landed plane tries to land at same airport" do
    airport7 = double("airport7", :planes => 50)
    airport7.stub(:get_weather => :sunny)
    plane7 = Plane.new(airport7)
    expect{plane7.land(airport7)}.to raise_error("already landed at this airport")
  end

  it "raises an error when a landed plane tries to land at another airport" do
    airport8 = double("airport8", :planes => 50)
    airport8.stub(:get_weather => :sunny)
    airport9 = double("airport9", :planes => 50)
    airport9.stub(:get_weather => :sunny)
    plane8 = Plane.new(airport8)
    expect{plane8.land(airport9)}.to raise_error("already landed at another airport")
  end

end

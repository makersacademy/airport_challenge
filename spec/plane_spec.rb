require 'plane'
require 'airport'
describe Plane do

  it "lands at an airport" do

    #airport = Airport.new
    airport = double("airport", :full => false, :weather => "sunny")
    plane = Plane.new(airport, "in the air")
    plane.land
    expect(plane.status).to eq "on the ground"
  end

  it "takes off from an airport" do
    #airport2 = Airport.new
    airport2 = double("airport2", :weather => "sunny")
    plane2 = Plane.new(airport2, "on the ground")
    plane2.take_off
    expect(plane2.status).to eq "in the air"
  end

  it "does not take off when in a stormy airport" do
    #airport3 = Airport.new("stormy")
    airport3 = double("airport3", :weather => "stormy")
    plane3 = Plane.new(airport3, "on the ground")
    plane3.take_off
    expect(plane3.status).to eq "on the ground"
  end

  it "does not land into a stormy airport" do
    #airport4 = Airport.new("stormy")
    airport4 = double("airport4", :weather => "stormy")
    plane4 = Plane.new(airport4, "in the air")
    plane4.land
    expect(plane4.status).to eq "in the air"
  end

  it "does not land into a full airport" do
    #airport5 = Airport.new("sunny",true)
    airport5 = double("airport5", :full => true, :weather => "sunny" )
    plane5 = Plane.new(airport5, "in the air")
    plane5.land
    expect(plane5.status).to eq "in the air"
  end
end

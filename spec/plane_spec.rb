require "plane"

describe Plane do
  let(:airport) { double :airport }

  it "has a method to allow user to land plane at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can land at airport if permission given" do
    airport_planes = []
    airport = instance_double("Airport", :permission_land? => true, :planes => airport_planes)
    subject.land(airport)
    expect(airport.planes.include?(subject)).to eq true
  end

  it "can depart airport if permission given" do
    airport_planes = [subject]
    airport = instance_double("Airport", :permission_depart? => true, :planes => airport_planes)
    subject.depart(airport)
    expect(airport.planes.include?(subject)).to eq false
  end

  it "can't land at airport if permission denied" do
    airport_planes = []
    airport = instance_double("Airport", :permission_land? => false, :planes => airport_planes)
    subject.land(airport)
    expect(airport.planes.include?(subject)).to eq false
  end

  it "can't depart airport if permission denied" do
    airport_planes = [subject]
    airport = instance_double("Airport", :permission_depart? => false, :planes => airport_planes)
    subject.depart(airport)
    expect(airport.planes.include?(subject)).to eq true
  end
end

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

  it "cannot be located at two airports at the same time" do
    airport = instance_double("Airport")
    subject.instance_variable_set(:@location, airport)
    airport_2_planes = []
    airport_2 = instance_double("Airport", :permission_land? => true, :planes => airport_2_planes)
    subject.land(airport_2)
    expect(airport_2.planes.include?(subject)).to eq false
  end

  it "is located in the air after departing an airport" do
    airport_planes = [subject]
    airport = instance_double("Airport", :permission_depart? => true, :planes => airport_planes)
    subject.depart(airport)
    expect(subject.instance_variable_get(:@location)).to eq(:air)
  end

  it "successfully departs an airport and lands at another" do
    airport_planes = [subject]
    airport_2_planes = []
    airport = instance_double("Airport", :permission_depart? => true, :planes => airport_planes)
    airport_2 = instance_double("Airport", :permission_land? => true, :planes => airport_2_planes)
    subject.depart(airport)
    subject.land(airport_2)
    expect(airport_2.planes.include?(subject)).to eq true
  end

end

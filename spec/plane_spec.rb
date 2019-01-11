require "plane"
require "airport"

describe Plane do
  it "has a method to allow user to land plane at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can land at airport if permission given" do
    fairport = Airport.new
    fairport.instance_variable_set(:@weather, :clear)
    subject.land(fairport)
    expect(fairport.planes.include?(subject)).to eq true
  end

  it "can depart airport if permission given" do
    fairport = Airport.new
    fairport.instance_variable_set(:@weather, :clear)
    fairport.instance_variable_set(:@planes, [subject])
    subject.depart(fairport)
    expect(fairport.planes.include?(subject)).to eq false
  end

  it "can't land at airport if permission denied" do
    stormport = Airport.new
    stormport.instance_variable_set(:@weather, :stormy)
    subject.land(stormport)
    expect(stormport.planes.include?(subject)).to eq false
  end

  it "can't depart airport if permission denied" do
    stormport = Airport.new
    stormport.instance_variable_set(:@weather, :stormy)
    stormport.instance_variable_set(:@planes, [subject])
    expect(stormport.planes.include?(subject)).to eq true
  end
end

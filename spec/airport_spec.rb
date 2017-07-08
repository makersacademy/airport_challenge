require 'airport'

describe Airport do

  let(:airport)     { Airport.new }
  let(:bigairport)  { Airport.new(10) }
  let(:plane)       { double(:plane, landed: nil, takeoff: nil, landed?: true) }

  it "responds to .full?" do
    expect(subject).to respond_to(:full?)
  end
  it "responds to .land(plane)" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "stores landed planes in @planes array" do
    airport.land(plane)
    expect(airport.planes).to include plane
  end
  it "turns plane.landed to true after it lands" do
    airport.land(plane)
    expect(plane.landed?).to eq true
  end
  it "responds to .takeoff(plane)" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end
  it "returns correct plane after takeoff" do
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq plane
  end
  it "can take an argument at creation to set capacity" do
    expect(bigairport.capacity).to eq 10
  end
end

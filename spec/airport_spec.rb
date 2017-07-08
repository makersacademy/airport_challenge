require 'airport'

describe Airport do

  let(:airport)     { Airport.new }
  let(:bigairport)  { Airport.new(10) }
  let(:plane)       { double(:plane, land: nil, takeoff: nil, landed?: false, space: 50, people: [], board: nil, alight: passenger) }
  let(:passenger)   { double(:passenger) }

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
  it "responds to .alight(plane)" do
    expect(subject).to respond_to(:alight).with(1).argument
  end
  it "responds to .board(plane)" do
    expect(subject).to respond_to(:board).with(1).argument
  end
  it "won't allow planes to alight when not at the current airport" do
    expect { airport.alight(plane) }.to raise_error(RuntimeError)
  end
  it "won't allow planes to board passengers when not at the current airport" do
    expect { airport.board(plane) }.to raise_error(RuntimeError)
  end
end

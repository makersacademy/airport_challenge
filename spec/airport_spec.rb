require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double Plane, land: true, take_off: true }
  before(:each) { allow(airport).to receive(:stormy?) { false } }

  it "stores a landing plane" do
    airport.receive(plane)
    expect(airport.aerodrome).to include(plane)
  end

  it "empties an aerodrome when the plane takes off" do
    airport.receive(plane)
    airport.release(plane)
    expect(airport.aerodrome).to_not include(plane)
  end

  it "does not receive a plane if it is full" do
    Airport::DEFAULT_CAPACITY.times { airport.receive(plane) }
    expect { airport.receive(plane) }.to raise_error("airport is full")
  end

  it "can check if the weather is stormy" do
    expect(airport.stormy?).to be false
  end

  it "can change the capacity of the airport" do
    expect(airport.capacity = Airport::DEFAULT_CAPACITY + 1).to be > Airport::DEFAULT_CAPACITY
  end

  it "does not receive a plane if the weather is stormy" do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.receive(plane) }.to raise_error("plane cannot land, the weather is stormy")
  end

  it "does not release a plane if the weather is stormy" do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.release(plane) }.to raise_error("plane cannot take off, the weather is stormy")
  end
end

require 'airport'
require 'weather'

describe Airport do

  it "prevents takeoff when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) { false }
    plane.land(airport)
    allow(Weather).to receive(:stormy?) { true }
    expect { plane.takeoff }.to raise_error "Airport is closed"
  end

  it "prevents landing when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) { true }
    expect { plane.land(airport) }.to raise_error "Airport is closed"
  end

  it "prevents landing if airport is full" do
    airport = Airport.new
    allow(Weather).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { airport.receive(Plane.new) }
    allow(Weather).to receive(:stormy?) { false }
    plane = Plane.new
    expect { plane.land(airport) }.to raise_error "Airport is closed"
  end

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

end

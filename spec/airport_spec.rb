require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  it "has the plane after it lands" do
    allow(weather).to receive(:stormy?).and_return false
    allow(plane).to receive(:land)
    airport = Airport.new(weather)
    airport.land(plane)
    expect(airport.planes).to include plane
  end
end

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  it "no longer has the plane after it takes off" do
    allow(weather).to receive(:stormy?).and_return false
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    airport = Airport.new(weather)
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes).not_to include plane
  end
end

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  before :each do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    allow(weather).to receive(:stormy?).and_return true
  end
  context "stormy tests"
  it "prevents landing in stormy weather" do
    stormy_airport = Airport.new(weather)
    expect { stormy_airport.land(plane) }.to raise_error(RuntimeError, "Cannot land in stormy weather")
  end
  it "prevents landing in stormy weather" do
    stormy_airport = Airport.new(weather)
    expect { stormy_airport.takeoff(plane) }.to raise_error(RuntimeError, "Cannot take off in stormy weather")
  end

end

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  before :each do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    allow(weather).to receive(:stormy?).and_return false
  end
  
end

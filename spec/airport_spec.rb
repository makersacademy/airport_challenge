require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  it "has the plane after it lands" do
    allow(weather).to receive(:stormy?).and_return false
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
    allow(weather).to receive(:stormy?).and_return false
  end
  context "capacity tests"
  it "prevents landing when the airport is full" do
    full_airport = Airport.new(weather, 1)
    full_airport.land(plane)
    expect { full_airport.land(plane) }.to raise_error(RuntimeError, "Airport is full")
  end
  it "can have the capacity overridden" do
    diff_capacity_airport = Airport.new(weather, 5)
    4.times { diff_capacity_airport.land(plane) }
    expect { diff_capacity_airport.land(plane) }.not_to raise_error()
  end
end

require 'airport'

describe Airport do
  let :plane {double :plane, flying: true, ground: nil, fly: nil}
  subject(:airport) {Airport.new}
  it "stores landed planes" do
    airport.land(plane)
    expect(airport.planes[0]).to eq(plane)
  end

  context "plane landed then departed" do
    it "releases planes after take-off" do
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      allow(plane).to receive(:flying) {false}
      airport.take_off(plane)
      expect(airport.planes).to eq([])
    end

    it "confirms last plane departed from airport" do
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.at_airport?(plane)).to eq(true)
    end
  end

  it "prevents take-off in stormy weather" do
    allow(airport).to receive(:stormy?) {true}
    airport.land(plane)
    expect {airport.take_off(plane)}.to raise_error("Cannot take-off during a storm")
  end

  it "won't allow landing after capacity reached" do
    airport.capacity.times {airport.land(plane)}
    expect {airport.land(plane)}.to raise_error("Airport full")
  end

  it "has an adjustable plane capacity" do
    airport = Airport.new(0)
    expect(airport.capacity).to eq(0)
  end

  it "only releases planes it contains" do
    expect {airport.take_off(plane)}.to raise_error("Plane not in airport")
  end

  it "only lands a flying plane" do
    allow(plane).to receive(:flying).and_return(false)
    expect {airport.land(plane)}.to raise_error("Plane is grounded")
  end

  it "changes status of plane to not flying when landing" do
    expect(plane).to receive(:ground)
    airport.land(plane)
  end

  it "changes status of plane to flying when taking-off" do
    allow(airport).to receive(:stormy?) {false}
    airport.land(plane)
    expect(plane).to receive(:fly)
    airport.take_off(plane)
  end
end

require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  it "lets a plane land" do
    expect(plane).to receive(:land)
    subject.land(plane)
  end
  it "has the plane after it lands" do
    allow(plane).to receive(:land)
    subject.land(plane)
    expect(subject.planes).to include plane
  end
end

describe Airport.new do
  let(:plane) { double(:plane) }
  it "lets a plane takeoff" do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    subject.land(plane)
    subject.takeoff(plane)
  end
  it "no longer has the plane after it takes off" do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include plane
  end
end

describe Airport.new do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  context "weather tests"
  it "prevents landing in stormy weather" do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    allow(weather).to receive(:stormy)
    expect(subject.land(plane)).to raise_error("cannot land in stormy weather")
  end

end

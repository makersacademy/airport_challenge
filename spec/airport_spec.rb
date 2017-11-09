require "airport"

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it "confirm plane has landed" do
    allow(airport).to receive(:weather) { false }
    expect(airport.land(plane)).to eq [plane]
  end

  it "confirm plane has taken off" do
    allow(airport).to receive(:weather) { false }
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end

  it "if stormy, plane does NOT take off" do
    allow(airport).to receive(:weather) { true }
    expect(airport.take_off(plane)).to eq "The skies are dark, best to stay on the ground"
  end

  it "If stormy, plane does NOT land" do
    allow(airport).to receive(:weather) { true }
    expect(airport.land(plane)).to eq "Got a storm front coming, cannot land here"
  end

  it "raises an error if terminal is full" do
    allow(airport).to receive(:weather) { false }
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("Airport is full")
  end
end

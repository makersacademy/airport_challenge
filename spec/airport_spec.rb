require "airport"
require "plane"

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }

  describe "default capacity" do
    it "defaults to 20 when no argument provided" do
      expect(subject.instance_variable_get(:@capacity)).to eq(20)
    end
  end

  describe "#land" do
    
    it "lands a plane at airport" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(:plane)).to eq([:plane])
    end

    it "doesn't allow landing when airport is full" do
      allow(subject).to receive(:stormy?) { false }
      20.times { subject.land(:plane) }
      expect { subject.land(:plane) }.to raise_error("Airport is full")
    end

    it "doesn't allow landing in stormy weather" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(:plane) }.to raise_error("Cannot land in stormy weather")
    end
  end

  describe "#takeoff" do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it "confirms plane takeoff from airport" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.takeoff(:plane)).to eq([])
    end

    it "doesn't allow takeoff in stormy weather" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.takeoff(:plane) }.to raise_error("Cannot takeoff in stormy weather")
    end
  end

end

require "airport"
require "plane"

describe Airport do

  describe "default capacity" do
    it "defaults to 20 when no argument provided" do
      subject { Airport.new }
      expect(subject.instance_variable_get(:@capacity)).to eq(20)
    end

    it "can be set at initialization" do
      ap = Airport.new(10)
      expect(ap.instance_variable_get(:@capacity)).to eq(10)
    end
  end

  describe "#land" do
    
    it "lands a plane at airport" do
      allow(subject).to receive(:stormy?) { false }
      p1 = Plane.new
      expect(subject.land(p1)).to eq([p1])
    end

    it "doesn't allow landing when airport is full" do

      ap = Airport.new(1)
      allow(ap).to receive(:stormy?) { false }
      p1 = Plane.new
      p2 = Plane.new
      ap.land(p1)
      expect { ap.land(p2) }.to raise_error("Airport is full")
    end

    it "doesn't allow landing in stormy weather" do
      ap = Airport.new
      p1 = Plane.new
      allow(ap).to receive(:stormy?) { true }
      expect { ap.land(p1) }.to raise_error("Cannot land in stormy weather")
    end
    
    it "raises an error if a plane is already landed" do

      newport = Airport.new
      allow(newport).to receive(:stormy?) { false }
      p1 = Plane.new
      newport.land(p1)
      expect { newport.land(p1) }.to raise_error("Plane already landed")
    end

  end

  describe "#takeoff" do
    subject { Airport.new }
    let(:plane) { Plane.new(false) }
    it "confirms plane takeoff from airport" do
      ap = Airport.new
      allow(ap).to receive(:stormy?) { false }
      p1 = Plane.new
      ap.land(p1)
      expect(ap.takeoff(p1)).to eq([])
    end

    it "doesn't allow takeoff in stormy weather" do
      ap = Airport.new
      allow(ap).to receive(:stormy?) { false }
      p1 = Plane.new()
      ap.land(p1)
      allow(ap).to receive(:stormy?) { true }
      expect { ap.takeoff(p1) }.to raise_error("Cannot takeoff in stormy weather")
    end
  end

end

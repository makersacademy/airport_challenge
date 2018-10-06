require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#land" do
    it "should instruct a plane to land" do
      allow(subject.weather).to receive(:current).and_return("Sunny")
      expect(subject.land(plane)).to eq "Plane has landed"
    end

    it "should store the plane in the airport" do
      allow(subject.weather).to receive(:current).and_return("Sunny")
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    it "should raise error if planes are already in the airport" do
      allow(subject.weather).to receive(:current).and_return("Sunny")
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane has already landed")
    end

    it "should raise when the weather is stormy" do
      allow(subject.weather).to receive(:current).and_return("Stormy")
      expect { subject.land(plane) }.to raise_error("Cannot land in stormy weather")
    end

  end

  describe "#takeoff" do
    it "should confirm plane is no longer at airport after takeoff" do
      allow(subject.weather).to receive(:current).and_return("Sunny")
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hangar).to eq []
    end

    it "should raise error if plane is not in airport" do
      expect { subject.takeoff(plane) }.to raise_error("Plane is not at airport")
    end

    it "should prevent takeoff when the weather is stormy" do
      allow(subject.weather).to receive(:current).and_return("Sunny")
      subject.land(plane)
      allow(subject.weather).to receive(:current).and_return("Stormy")
      expect { subject.takeoff(plane) }.to raise_error("Cannot takeoff in stormy weather")
    end
  end
end

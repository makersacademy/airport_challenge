require "airport"

describe Airport do
  plane = Plane.new

  describe "#capacity" do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it "has a default capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Airport full"
    end

    it "introduce capacity at initialization" do
      airport = Airport.new(20)
      20.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full"
    end
  end

  describe "#land_plane" do
    it "an instance of a plane lands" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "plane cannot land in stormy weather" do
      allow(subject).to receive(:weather) { 5 }
      expect { subject.land(plane) }.to raise_error "No landing during storm"
    end
  end

  describe "#take_off" do
    it "confirm plane has taken off" do
      subject.land(plane)
      expect { subject.take_off }.to change { subject.planes.count }.by(-1)
    end

    it "plane cannot take off in stormy weather" do
      allow(subject).to receive(:weather) { 5 }
      expect { subject.take_off }.to raise_error "No take off during storm"
    end
  end
end

require "airport"

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  describe "#capacity" do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it "has a default capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Airport full"
    end

    it "introduce variable capacity at initialization" do
      airport = Airport.new(20)
      20.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full"
    end
  end

  describe "#land_plane" do
    it "allows plane to land" do
      expect(subject.land(plane)).to include plane
    end

    it "an instance of a plane landed" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe "#take_off" do
    it "a plane can take off" do
      plane = subject.take_off
    end

    it "confirm plane has taken off" do
      subject.land(plane)
      subject.take_off
      expect(subject.planes.count).to eq(0)
    end
  end
end

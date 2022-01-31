require_relative "../lib/airport"

describe Airport do
  # Tests assume 0 Planes are at the airport on creation.
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "lands a plane at the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to include(plane)
    end
    it "refuses to land if capacity is exceeded" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The airport has no capacity."
    end
    it "refuses to land if weather is 'Stormy'" do
      airport = described_class.new(weather: "Stormy")
      expect { airport.land(Plane.new) }.to raise_error "The Plane can't land it is too stormy."
    end

  end
  describe "#take_off" do
    it { is_expected.to respond_to :take_off }
    it "takes off a plane from the airport" do
      subject.land(Plane.new)
      expect(subject.take_off).to be_a(Plane)
    end
    it "returns a confirmation the plane is flying" do
      subject.land(Plane.new)
      plane = subject.take_off
      expect(plane.flying).to eq true
    end
    it "refuses to take off if weather is 'Stormy'" do
      airport = described_class.new(weather: "Stormy")
      expect { airport.take_off }.to raise_error "The Plane can't take off it is too stormy."
    end
  end

  describe "#capacity" do
    it "Overrides default capacity value" do
      airport = described_class.new(6)
      expect(airport.capacity).to eq 6
    end
    it "Checks default value is correct" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

end

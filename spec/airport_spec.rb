require_relative "../lib/airport"

describe Airport do
  # Tests assume 0 Planes are at the airport on creation.
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "lands a plane at the airport" do
      expect(subject.land(Plane.new)).to eq "Landed successfully"
    end
    it "refuses to land if capacity is exceeded" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The airport has no capacity."
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

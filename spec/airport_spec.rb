require_relative "../lib/airport"

describe Airport do
  # Tests assume 0 Planes are at the airport on creation.
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "lands a plane at the airport" do
      expect(subject.land(Plane.new)).to eq "Landed successfully"
    end
    it "refuses to land if capacity is exceeded" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
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
end

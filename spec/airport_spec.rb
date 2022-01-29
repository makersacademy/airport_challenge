require_relative "../lib/airport"

describe Airport do
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "lands a plane at the airport" do
      expect(subject.land(Plane.new)).to eq "Landed"
    end
  end
  describe "#take_off" do
    it { is_expected.to respond_to :take_off }
    it "takes off a plane from the airport" do
      expect(subject.take_off).to be_a(Plane)
    end
    it "returns a confirmation the plane is flying" do
      plane = subject.take_off
      expect(plane.flying).to eq true
    end
  end
end

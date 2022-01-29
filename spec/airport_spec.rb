require_relative "../lib/airport"

describe Airport do
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "lands a plane at the airport" do
      expect(subject.land(Plane.new)).to eq "Landed"
    end
  end
end

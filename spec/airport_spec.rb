require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do
    it "should be able to instruct a plane to land" do
      expect(subject.land(plane)).to eq "Plane has landed"
    end
    it "should store the plane in the airport" do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end
  end
end

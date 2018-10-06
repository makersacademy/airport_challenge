require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do
    it "should instruct a plane to land" do
      expect(subject.land(plane)).to eq "Plane has landed"
    end
    it "should store the plane in the airport" do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end
    it "should raise error if planes are already in the airport" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane has already landed")
    end
  end

  describe "#takeoff" do
    it "should confirm plane is no longer at airport after takeoff" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hangar).to eq []
    end
  end
end

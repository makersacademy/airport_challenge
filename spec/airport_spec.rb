require 'airport'

describe Airport do
  let(:plane) { double :plane }
  
  describe "#land" do
    it "lets a plane land at an airport" do
      subject.land(plane)
      expect(subject.planes).to include plane  
    end

    it "confirms that the plane is no longer flying" do
      subject.land(Plane.new)
      expect(plane.flying?).to eq false
    end
  end
end
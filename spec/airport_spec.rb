require 'airport'

describe Airport do
  let(:plane) {double ("plane")}

  context "#land" do
    it "when landing a plane" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end
  
end

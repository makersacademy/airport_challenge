require 'airport'

describe Airport do
  let(:plane) {double ("plane")}

  context "#land" do
    it "is able to land a plane at the airport" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  context "#take_off" do
    it "allows a plane to take off from the airport" do
      subject.take_off(plane)
      expect(subject.planes).to_not include(plane)
    end
  end

end

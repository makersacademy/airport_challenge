require 'airport'

describe Airport do
  let(:plane) {double(:my_plane, landing: true, taking_off: true)}

  describe "#land" do

    it "should land a plane" do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be true
    end

  end

  describe "#takeoff" do

    it "should make a plane take off" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes.include?(plane)).to be false
    end

  end
end

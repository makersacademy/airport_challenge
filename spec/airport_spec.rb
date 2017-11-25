require 'airport'

describe Airport do

  describe "#land" do
    it "should land a plane" do
      plane = double(:my_landing_plane)
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be true
    end
  end

  describe "#takeoff" do
    it "should make a plane take off" do
      plane = double(:my_takeoff_plane)
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes.include?(plane)).to be false
    end
  end
end

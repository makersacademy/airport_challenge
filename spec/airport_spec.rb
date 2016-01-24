require 'airport'

describe Airport do

  describe "#landing" do
    it "should land a new plane into the airport" do
      test_plane = Plane.new
      expect(test_plane).to eq test_plane
    end

    it "should confirm when a plane has landed" do
      test_plane = Plane.new
      expect(test_plane.landed?).to eq true
    end

    it "should not let a plane land if it is stormy" do
      test_plane = Plane.new
      expect(test_plane.stormy?).to eq true
    end
  end

  describe "#takeoff" do
    it "should confirm that a plane has take off from the airport" do
      test_plane = Plane.new
      expect(test_plane.taken_off?).to eq true
    end

    it "should not allow planes to take off if there is no plane" do
      test_plane = Plane.new
      expect {subject.take_off}.to raise_error("No plane has taken off")
    end
  end

end

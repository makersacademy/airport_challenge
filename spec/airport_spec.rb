require 'airport'

describe Airport do

  describe "#landing" do
    it "should land a new plane into the airport" do
      test_plane = Plane.new
      expect(subject.land(test_plane).last).to eq test_plane
    end

    it "confirms when a plane has landed" do
      test_plane = Plane.new
      expect(test_plane.landed?).to eq true
    end

    it "does not let a plane land if it is stormy" do
      test_plane = Plane.new
      expect(test_plane.stormy?).to eq true
    end

    it "does not let a plane land if over capacity" do
      test_plane = Plane.new
       subject.set_capacity.times{subject.land(test_plane)}
       expect{subject.land(test_plane)}.to raise_error("The airport is at maximum capacity.")
    end
  end

  describe "#takeoff" do
    it "should confirm that a plane has taken off from the airport" do
      test_plane = Plane.new
      expect(test_plane.taken_off?).to eq true
    end

    it "should not allow planes to take off if there is no plane scheduled to take off" do
      test_plane = Plane.new
      expect {subject.take_off}.to raise_error("There is no plane scheduled to take off")
    end

    it "does not let a plane take off if it is stormy" do
      test_plane = Plane.new
      expect(test_plane.stormy?).to eq true
    end
  end

end

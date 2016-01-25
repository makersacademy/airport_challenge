require 'airport'

describe Airport do

  describe "#landing" do
    plane = Plane.new
    it "should land a new plane into the airport" do
      expect(subject.land(plane).last).to eq plane
    end

    it "confirms when a plane has landed" do
      expect(plane.land).to eq false
    end

    it "does not let a plane land if over capacity" do
       subject.set_capacity.times{subject.land(plane)}
       expect{subject.land(plane)}.to raise_error("The airport is at maximum capacity.")
    end
  end

  describe "#takeoff" do
    plane = Plane.new
    it "should confirm that a plane has taken off from the airport" do
      expect(plane.take_off).to eq true
    end

    it "should not allow planes to take off if there is no plane scheduled to take off" do
      expect {subject.take_off}.to raise_error("There is no plane scheduled to take off")
    end
  end
end

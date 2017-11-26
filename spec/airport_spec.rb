require "airport"
require "weather"

describe Airport do
  describe "#land" do
    it "allows the plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end
    it "raises an error if plane cannot land because airport at default capacity" do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      message = "Airport at full capacity, plane unable to land"
      expect { subject.land(plane) }.to raise_error message
    end
    it "checks if airport capacity is default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#take_off" do
    it "allows the plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq "Plane has taken off"
    end
    it "raises an error if there is no plane for take off" do
      expect { subject.take_off }.to raise_error "No plane for take off"
    end
    it "confirms plane is no longer in airport" do
      expect(subject.hangar).to be_empty
    end
  end

end

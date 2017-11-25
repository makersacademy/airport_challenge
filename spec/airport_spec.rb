require "airport"
require "weather"

describe Airport do
  describe "#land" do
    it "allows the plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
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

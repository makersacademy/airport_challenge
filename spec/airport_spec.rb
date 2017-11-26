require "airport"
require "weather"

describe Airport do
  before(:each) do
    allow(subject).to receive(:stormy?).and_return(false)
  end
  describe "#land" do
    it "allows the plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end
    it "raises an error if plane has already landed" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already landed"
    end
    it "raises an error if plane cannot land because airport at default capacity" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      message = "Airport at full capacity, plane unable to land"
      expect { subject.land(Plane.new) }.to raise_error message
    end
    it "checks if airport capacity is default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "sets the airport capacity to 5" do
      subject.capacity = 5
      expect(subject.capacity). to eq 5
    end
    it "raises an error if airport full with non-default capacity" do
      subject.capacity = 5
      subject.capacity.times { subject.land(Plane.new) }
      message = "Airport at full capacity, plane unable to land"
      expect { subject.land(Plane.new) }.to raise_error message
    end
    it "doesn't allow plane to land due to stormy weather" do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Stormy weather, plane unable to land"
      expect { subject.land(plane) }.to raise_error message
    end
  end

  describe "#take_off" do
    it "allows the plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end
    it "raises an error if plane has already taken off" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error "Plane already taken off"
    end
    it "confirms plane taken off is no longer in hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).not_to include plane
    end
    it "confirms plane is no longer in airport" do
      expect(subject.hangar).to be_empty
    end
    it "doesn't allow plane to take off due to stormy weather" do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Stormy weather, plane unable to take off"
      expect { subject.take_off(plane) }.to raise_error message
    end
  end

end

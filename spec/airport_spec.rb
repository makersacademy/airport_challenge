require './lib/airport'

describe Airport do
  
  describe "Create airport" do
    it "Creates a new airport instance" do
      expect(Airport.new).to be_an_instance_of Airport
    end
  end

  describe "#land" do
    it "allows plane to land at airport" do
      plane = Plane.new
      expect(Airport.new.land(plane)).to include plane
    end

    it "rejects plane if hangar is full" do
      plane = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      plane4 = Plane.new
      subject.land(plane)
      expect { subject.land(plane4) }.to raise_error "No space available"
    end
  end

  describe "#take_off" do
    it "allows the plane to take off" do
      plane = Plane.new
      Airport.new.land(plane)
      expect(Airport.new.take_off(plane)).to eq plane
    end

    it "confirms plane no longer at airport" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.take_off(plane) }.to change { subject.hangar }
    end
  end

  describe "#weather" do
    it "prevents take off in stormy weather" do
      airport = Airport.new
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
    end

    it "prevents landing in stormy weather" do
      airport = Airport.new
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Cannot land plane due to stormy weather"
    end
  end
end

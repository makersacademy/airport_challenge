require "airport"

describe Airport do
  
  describe "#land" do
    it "responds to land(plane)" do
      expect { subject.to respond_to(:land).with(1).argument }
    end
  
    it "adds a plane to the hangar" do
      plane = Plane.new
      expect(subject.land(plane)[0]).to eq plane
    end

    it "raises an error when capacity is reached" do
      5.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error "Airport is full"
    end
  end

  describe "#take_off" do
    it "responds to take_off" do
      expect { subject.to respond_to(:take_off).with(1).argument }
    end

    it "removes a plane from the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end
end

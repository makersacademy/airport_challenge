require "airport"

describe Airport do

  describe "#land" do

    it "responds to 'land' method" do
      expect(subject).to respond_to(:land)
    end

    it "should store the plane in the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

  end

  describe "#initialize" do
  
    it "should have no planes when initilized" do
      expect(subject.planes).to eq []
    end
  end

  describe "#take_off" do

    it "should return the plane that has left" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it "should remove the plane that's taken off from the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to eq []
    end

  end
end

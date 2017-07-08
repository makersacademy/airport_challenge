require "airport"

describe Airport do

  describe "initialization" do
    it "should have a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should be able to have a different capacity set" do
      gatwick = described_class.new(50)
      expect(gatwick.capacity).to eq 50
    end
  end

  describe "#land" do
    it "lands planes and stores them" do
      boeing = Plane.new
      subject.land(boeing)
      expect(subject.planes.pop).to eq boeing
    end

    it "can store multiple planes" do
      boeing1 = Plane.new
      boeing2 = Plane.new
      subject.land(boeing1)
      subject.land(boeing2)
      expect(subject.planes).to eq [boeing1, boeing2]
    end
  end

  describe "#takeoff" do
    it "removes planes from the airport" do
      boeing = Plane.new
      subject.land(boeing)
      subject.takeoff(boeing)
      expect(subject.planes).to eq []
    end
  end

end

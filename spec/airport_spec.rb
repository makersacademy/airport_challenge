require "airport"

describe Airport do

  describe "#initialize" do
    it "Creates airports with default capacity of 20" do
      heathrow = Airport.new("Heathrow")
      expect(heathrow.capacity).to eq(20)
    end
    it "Creates airports with any given capacity" do
      gatwick = Airport.new("Gatwick", 10)
      expect(gatwick.capacity).to eq(10)
    end
  end
  describe "#land" do
    it "Adds the plane to the list of planes at the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end
  describe "#take_off" do
    it "Removes the plane from the list of planes at the airport" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
  describe "#full?" do
    it "Return true if airport is full" do
      plane = Plane.new
      subject.capacity.times {subject.land(plane)}
      expect(subject.full?).to be true
    end
  end
end

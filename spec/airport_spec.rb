require "airport"
  
describe Airport do
  describe ".land" do
    it "should show plane in airport array after airport tells it to land" do
      plane = double("plane double")
      subject.land(plane)
      expect(subject.planes.length).to(eq(1))
    end
    it "should return an error if trying to land a plane at a full airport" do
      plane = double("plane double")
      subject.planes << plane
      expect{subject.land(plane)}.to(raise_error("CANNOT LAND. THIS AIRPORT IS FULL."))
    end
  end

  describe ".takeoff" do
    it "should show plane is no longer in airport array after airport tells it to takeoff" do
      plane = double("plane double")
      subject.planes << plane
      subject.takeoff()
      expect(subject.planes.length).to(eq(0))
    end
  end

  describe ".full?" do
    it "should return true if method is called on a full airport" do
      plane = double("plane double")
      subject.planes << plane
      expect(subject.full?).to(eq(true))
    end
  end

  describe ".capacity" do
    it "should give airport a capacity provided by the user on initialization" do
      airport = Airport.new(20)
      expect(airport.capacity).to(eq(20))
    end
  end
end

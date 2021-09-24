require "airport"
  
describe Airport do
  describe ".land" do
    it "should show plane in airport array after airport tells it to land" do
      plane = double("plane double")
      subject.land(plane)
      expect(subject.planes.length).to(eq(1))
    end
    it "should raise an error if trying to land a plane at a full airport" do
      plane = double("plane double")
      subject.planes << plane
      expect{subject.land(plane)}.to(raise_error("CANNOT LAND. THIS AIRPORT IS FULL."))
    end
    it "should raise an error if trying to land a plane when the weather is stormy" do
      plane = double("plane double")
      weather = double("weather double", :current => "stormy")
      expect{subject.land(plane)}.to(raise_error("CANNOT LAND. THE WEATHER IS STORMY."))
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
    it "should check that airports are given a default capacity of 10 planes if not provided" do
      airport = Airport.new
      expect(airport.capacity).to(eq(1))
    end
  end
end

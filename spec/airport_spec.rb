require "airport"
  
describe Airport do
  describe ".land" do
    let(:plane) { double(:plane, :position => "air", :change_position => "ground") }
    weather = "sunny"
    it "should show plane in airport array after airport tells it to land" do
      subject.land(plane, weather)
      expect(subject.planes.length).to(eq(1))
    end
    it "should raise an error if trying to land a plane at a full airport" do
      subject.planes << plane
      expect { subject.land(plane, weather) }.to(raise_error("CANNOT LAND. THIS AIRPORT IS FULL."))
    end
    it "should raise an error if trying to land a plane when the weather is stormy" do
      weather = double("weather double", :current => "stormy")
      current_weather = weather.current
      expect { subject.land(plane, current_weather) }.to(raise_error("CANNOT LAND. THE WEATHER IS STORMY."))
    end
    it "should show plane in airport array after airport tells it to land during sunny weather" do
      weather = double("weather double", :current => "sunny")
      current_weather = weather.current
      subject.land(plane, current_weather)
      expect(subject.planes.length).to(eq(1))
    end
    it "should raise error when asking grounded plane to land" do
      allow(plane).to receive(:position).and_return("ground")
      expect { subject.land(plane, weather) }.to(raise_error("CANNOT LAND. THIS PLANE IS ON THE GROUND."))
    end
  end

  describe ".takeoff" do
    let(:plane) { double(:plane, :position => "ground", :change_position => "air") }
    let(:plane2) { double(:plane2, :position => "ground", :change_position => "air") }
    let(:plane3) { double(:plane3, :position => "ground", :change_position => "air") }
    let(:plane4) { double(:plane4, :position => "ground", :change_position => "air") }
    it "should show plane is no longer in airport array after airport tells it to takeoff" do
      subject.planes << plane
      subject.takeoff(plane, "sunny")
      expect(subject.planes.length).to(eq(0))
    end
    it "should raise an error if plane trying to takeoff when the weather is stormy" do
      weather = double("weather double", :current => "stormy")
      current_weather = weather.current
      subject.planes << plane
      expect { subject.takeoff(plane, current_weather) }.to(raise_error("CANNOT TAKEOFF. THE WEATHER IS STORMY."))
    end
    it "should show plane removed from airport array after airport tells it to takeoff during sunny weather" do
      subject.planes << plane
      weather = double("weather double", :current => "sunny")
      current_weather = weather.current
      subject.takeoff(plane, current_weather)
      expect(subject.planes.length).to(eq(0))
    end
    it "should raise error when asking a flying plane to takeoff" do
      allow(plane).to receive(:position).and_return("air")
      subject.planes << plane # to isolate test -- code should not allow planes in airport to have air status
      expect { subject.takeoff(plane, "sunny") }.to(raise_error("CANNOT TAKEOFF. THIS PLANE IS IN THE AIR."))
    end
    it "when 2 planes takeoff, those 2 specific planes should not be in the airport array and the others remain" do
      airport = Airport.new
      [plane, plane2, plane3, plane4].each { |plane| airport.planes << plane }
      airport.takeoff(plane2, "sunny")
      airport.takeoff(plane3, "sunny")
      expect(airport.planes).to(eq([plane, plane4]))
    end
    it "should raise error when calling takeoff on plane that is not at that airport" do
      airport1 = Airport.new
      airport2 = Airport.new
      airport2.planes << plane
      expect { airport1.takeoff(plane, "sunny") }.to(raise_error("CANNOT TAKEOFF. THIS PLANE IS NOT AT THIS AIRPORT"))
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

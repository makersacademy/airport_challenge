require "airport"

describe "Airport" do
  describe "#land" do
    it "should land and store a single plane in the airport" do
      airport = Airport.new
      airport.weather_set("sunny")
      airport.land(Plane.new)
      expect(airport.empty_hanger?).to(eq(false))
    end 
    it "should return an error when you try to land a plane in a full hanger" do
      airport = Airport.new()
      airport.weather_set("sunny")
      20.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to(raise_error("The hanger is full!"))
    end

    it "should allow you to pass an adjusted capacity" do
      airport = Airport.new(50)
      airport.weather_set("sunny")
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to(raise_error("The hanger is full!"))
    end
    
    it "should not allow land when weather is stormy" do
      airport = Airport.new
      airport.weather_set("stormy")
      expect { airport.land(Plane.new) }.to(raise_error("The weather is too rough to land"))
    end
    
  end

  describe "#takeoff" do
    it "should return true when empty? is called after takeoff" do
      airport = Airport.new
      airport.weather_set("sunny")
      airport.land(Plane.new)
      airport.takeoff
      expect(airport.empty_hanger?).to(eq(true))
    end

    it "should not allow takeoff when weather is stormy" do
      airport = Airport.new
      airport.weather_set("sunny")
      airport.land(Plane.new)
      airport.weather_set("stormy") 
      expect { airport.takeoff }.to(raise_error("The weather is too rough to takeoff"))
    end
  end

  describe "#empty_hanger?" do
    it "should return the hanger is empty before a plane is landed" do
      airport = Airport.new
      expect(airport.empty_hanger?).to(eq(true))
    end

    it "should return the hanger is not empty after a plane is landed" do
      airport = Airport.new
      airport.weather_set("sunny")
      airport.land(Plane.new)
      expect(airport.empty_hanger?).to(eq(false))
    end
  end
  describe "#random_weather" do
    
    it "should set the weather to not nil if no weather is given" do
      airport = Airport.new
      expect(airport.weather).not_to eq (nil)
    end
  end
end

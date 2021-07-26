require "airport"

describe "Airport" do
  describe "#land" do
    it "should land and store a single plane in the airport" do
      weather_dbl = double("weather", :weather => "sunny")
      airport = Airport.new(weather: weather_dbl)
      airport.land(Plane.new)
      expect(airport.empty_hanger?).to(eq(false))
    end 
    it "should return an error when you try to land a plane in a full hanger" do
      weather_dbl = double("weather", :weather => "sunny")
      airport = Airport.new(weather: weather_dbl)
      20.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to(raise_error("The hanger is full!"))
    end

    it "should allow you to pass an adjusted capacity" do
      weather_dbl = double("weather", :weather => "sunny")
      airport = Airport.new(weather: weather_dbl, capacity: 50)
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to(raise_error("The hanger is full!"))
    end
    
    it "should not allow land when weather is stormy" do
      weather_dbl = double("weather", :weather => "stormy")
      airport = Airport.new(weather: weather_dbl)
      expect { airport.land(Plane.new) }.to(raise_error("The weather is too rough to land"))
    end
  end

  describe "#takeoff" do
    it "should be empty after the only plane has taken off" do
      weather_dbl = double("weather", :weather => "sunny")
      hanger_dbl = [Plane.new]
      airport = Airport.new(weather: weather_dbl, hanger: hanger_dbl)
      airport.takeoff
      expect(airport.empty_hanger?).to(eq(true))
    end

    it "should not allow takeoff when weather is stormy" do
      hanger_dbl = [Plane.new]
      weather_dbl = double("weather", :weather => "stormy")
      airport = Airport.new(weather: weather_dbl, hanger: hanger_dbl)
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
      airport.land(Plane.new)
      expect(airport.empty_hanger?).to(eq(false))
    end
  end
end

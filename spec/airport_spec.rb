require_relative "../../lib/airport.rb"

describe "Airport" do
  describe "#land" do
    it "should land and store a single plane in the airport" do
      airport = Airport.new
      airport.land(Plane.new)
      expect(airport.empty_hanger?).to(eq(false))
    end 
    it "should return an error when you try to land a plane in a full hanger" do
      airport = Airport.new
      airport.capacity.times(airport.land(Plane.new))
      expect{airport.land(Plane.new)}.to(raise_error("The hanger is full!"))
    end
    
  end

  describe "#takeoff" do
    it "should return true when empty? is called after takeoff" do
      airport = Airport.new
      airport.land(Plane.new)
      airport.takeoff
      expect(airport.empty_hanger?).to(eq(true))
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

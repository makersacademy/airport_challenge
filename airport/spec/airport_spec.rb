# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

require "airport"

RSpec.describe Airport do
  describe "plane_to_land" do
    it "plane landed so add to hanger" do
      airport = Airport.new
      airport.plane_to_land("flight1")
      expect(airport.hanger).to include "flight1"
    end
  end
  describe "plane_takeoff" do
    it "plane leaves and confirm" do
      airport = Airport.new
      airport.plane_takeoff("flight1")
      expect(airport.hanger).not_to include "flight1"
    end
  end
  describe "no_landing" do
    it "checks size of hanger" do
      airport = Airport.new
      expect(airport.no_landing).to be <= 4
    end
  end
end

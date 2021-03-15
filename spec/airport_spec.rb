require 'spec_helper'
require 'airport'
# User story:
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
describe Airport do

  describe "land_plane" do
    it "Returns true when plane has been instructed to land" do
      plane = Plane.new
      airport = Airport.new
      airport.land_plane(plane)
      expect(airport.plane_landed?(plane)).to be true
    end
  end

  describe "plane_landed?" do
    it "Returns false when there is no plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.plane_landed?(plane)).to be false
    end
  end
# User story
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  describe "take_off" do
    it "Returns true when plane has been instructed to take off" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to be true
    end
  end
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
  describe "prevent_landing"
    it "Prevents landing when the airport is full by using a default capacity" do
      airport = Airport.new
      plane = Plane.new
      airport.capacity = 10
      expect(airport.capacity).to eq(10)
    end
  end

require 'spec_helper'
require 'airport'
require 'plane'
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
  describe "prevent_landing" do
    it "Prevents landing when the airport is full by using a default capacity" do
      airport = Airport.new
      airport.capacity = 10
      expect(airport.capacity).to eq(10)
    end
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  describe "override" do
    it "default capacity which can be overridden" do
      airport = Airport.new(9)
      expect(airport.capacity).to eq(9)
    end
    it "can add more than 10 planes" do
      airport = Airport.new(1)
      expect(airport.capacity).to eq(1)
      plane = Plane.new
      airport.land_plane(plane)
      plane_two = Plane.new
      expect { airport.land_plane(plane_two) }.to raise_error 'airport capacity full'
    end
  end
end
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

#   describe "prevent_take_off" do
#     it "If weather is stormy prevent take off" do
#        airport = Airport.new
#        plane = Plane.new
#        airport.prevent_take_off(plane)
#        expect { airport.prevent_take_off(planes) }.to raise_error 'weather is stormy'
#     end
#   end

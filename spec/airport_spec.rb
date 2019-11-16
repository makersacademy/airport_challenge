require 'airport'
require 'plane'

describe Airport do

  describe "#land" do

    it "should land the plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq "Plane has been landed"
    end

    it "should not land when the airport is full" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      plane_2 = Plane.new
      expect(airport.land(plane_2)).to eq "That airport is full, cannot land"
    end

  end

  describe "#take_off" do

    it "should have the plane take off from the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to eq "Plane has taken off"
    end

  end

  describe "initialize" do

    it "should set default airport CAPACITY" do
      airport = Airport.new
      Airport::CAPACITY.times { airport.land(Plane.new) }
      plane = Plane.new
      expect(airport.land(plane)).to eq "That airport is full, cannot land"
    end

    it "should override default airport CAPACITY" do
      override_capacity = 10
      airport = Airport.new(override_capacity)
      override_capacity.times { airport.land(Plane.new) }
      plane = Plane.new
      expect(airport.land(plane)).to eq "That airport is full, cannot land"
    end

  end

end

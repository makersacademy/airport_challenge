require 'plane'
require 'airport'

describe Plane do

  describe "#land" do
    it "responds to land method" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands at a specific airport" do
      airport = Airport.new
      expect(subject.land(airport)).to eq("Plane #{subject} landed at #{airport}.")
    end

    it "asks from airport to append plane to landed ones" do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      expect(airport.landed_planes[-1]).to eq(plane)
    end
  end

  describe "#take_off" do
    it "responds to take_off method" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "takes off from a specific airport" do
      airport = Airport.new
      expect(subject.take_off(airport)).to eq("Plane #{subject} took off from #{airport}.")
    end

    it "asks the airport to remove the plane from the landed_planes list" do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      expect(airport.outbound_flight(plane)).to eq(plane)
    end
  end

end

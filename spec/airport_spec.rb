require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    it "should land the plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq "Plane has been landed"
    end
  end

  describe "#take_off" do
    it "should have the plane take off from the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to eq "Plane has taken off"
    end
  end
    
end

require 'plane'
require 'airport'

describe "ATC" do

  context "The plane lands" do

    it "should be at the airport which the plane has just landed" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport1 = Airport.new
      plane1.land(airport1)
      plane2.land(airport1)
      expect(plane1).to be_landed
      expect(plane2).to be_landed
      expect(airport1.planes).to include(plane2,plane1)
    end

  end

  context "The plane takes off" do

    it "should be no longer at the airport when the plan has taken off" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport1 = Airport.new
      plane1.take_off(airport1)
      plane2.take_off(airport1)
      expect(airport1.planes).not_to include(plane1,plane2)
    end

  end

end

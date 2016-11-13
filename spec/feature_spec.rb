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

    it "should land if the airport is not full" do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      airport = Airport.new(capacity = 3)
      plane1.land(airport)
      plane2.land(airport)
      plane3.land(airport)
      expect(airport.planes).to include(plane2,plane1,plane3)
    end

    it "should NOT land if the airport is full" do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      plane4 = Plane.new
      airport = Airport.new(capacity = 3)
      plane1.land(airport)
      plane2.land(airport)
      plane3.land(airport)
      expect{ plane4.land(airport) }.to raise_error "The airport is full."
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

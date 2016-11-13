require 'plane'
require 'airport'

describe "ATC" do

  context "The plane lands" do

    it "should be at the airport which the plane has just landed" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport1 = Airport.new
      allow(plane1).to receive (:weather) {2}
      allow(plane2).to receive (:weather) {1}
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
      allow(plane1).to receive (:weather) {2}
      allow(plane2).to receive (:weather) {2}
      allow(plane3).to receive (:weather) {2}
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
      allow(plane1).to receive (:weather) {1}
      allow(plane2).to receive (:weather) {2}
      allow(plane3).to receive (:weather) {2}
      allow(plane4).to receive (:weather) {2}
      plane1.land(airport)
      plane2.land(airport)
      plane3.land(airport)
      expect{ plane4.land(airport) }.to raise_error "The airport is full."
    end

    it "should NOT land again if it's just landed" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive (:weather) {2}
      allow(plane).to receive (:weather) {2}
      plane.land(airport)
      expect{ plane.land(airport) }.to raise_error "Can't land again."
    end

    it "should NOT be able to land the plane if it's stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive (:weather) {0}
      expect{ plane.land(airport) }.to raise_error "It is stormy. We can't land the plane."
    end

  end

  context "The plane takes off" do

    it "should be no longer at the airport when the plan has taken off" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      allow(plane1).to receive (:weather) {2}
      allow(plane2).to receive (:weather) {1}
      plane1.land(airport)
      plane2.land(airport)
      allow(plane1).to receive (:weather) {2}
      allow(plane2).to receive (:weather) {1}
      plane1.take_off(airport)
      plane2.take_off(airport)
      expect(airport.planes).not_to include(plane1,plane2)
    end

    it "should NOT take off again when the plane has just taken off" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive (:weather) {2}
      plane.land(airport)
      allow(plane).to receive (:weather) {1}
      plane.take_off(airport)
      allow(plane).to receive (:weather) {1}
      expect{ plane.take_off(airport)}.to raise_error "Can't take off again."
    end

    it "should NOT take off if it's stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive (:weather) {1}
      plane.land(airport)
      allow(plane).to receive (:weather) {0}
      expect{ plane.take_off(airport) }.to raise_error "It is stormy. We can't take off."
    end

  end

end

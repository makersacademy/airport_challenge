require 'plane'
require 'airport'
describe Plane do
  describe "#land" do
    it "expects a plane to be able to land" do
      expect(subject).to respond_to(:land)
    end
    it "expects land method to raise error if argument is not an airport object" do
      plane = Plane.new
      expect { plane.land(String.new) }.to raise_error 'argument is not an airport object'
    end
    it "expects to prevent landing if airport has a true blocked_airport attribute" do
      plane = Plane.new
      airport3 = Airport.new
      airport3.blocked_airport = true
      expect { plane.land(airport3) }.to raise_error(RuntimeError, "Plane cannot land because the airport is having technical difficulties")
    end

  end
  describe "#take_off" do
    it "expects the plane to take off and set the in_the_air variable to true" do
      airport = Airport.new
      plane = Plane.new
      plane.take_off(airport)
      expect(plane.in_the_air?).to eq true
    end
    it "expects to prevent taking_off when airport has a true blocked_airport attribute" do
      airport = Airport.new
      plane = Plane.new
      airport.blocked_airport = true
      expect { plane.take_off(airport) }.to raise_error 'Plane cannot take off because the airport is having technical difficulties'
    end
  end
  describe "#airport_exited" do
    it "expects a plane to save airport ID after it has taken off " do
      airport1 = Airport.new
      plane1 = Plane.new
      plane1.take_off(airport1)
      expect(plane1.airport_exited).to eq airport1.__id__
    end
  end
  describe "#confirm_take_off" do
    it "expects a plane to confirm that he has exited specific airport" do
      airport1 = Airport.new
      plane1 = Plane.new
      plane1.take_off(airport1)
      expect(plane1.confirm_take_off(airport1)).to eq true
    end
  end
  describe "#confirm_take_off" do
    it "expects a plane to output false if we confirm_take_off the wrong airport" do
      airport1 = Airport.new
      airport2 = Airport.new
      plane1 = Plane.new
      plane1.take_off(airport1)
      expect(plane1.confirm_take_off(airport2)).to eq false
    end
  end
end

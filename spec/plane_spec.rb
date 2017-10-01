require 'plane'
require 'airport'
describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new("WhereAmI Airport") }

  describe "#land" do
    it "expects a plane to be able to land" do
      expect(plane).to respond_to(:land)
    end
    it "expects land method to raise error if argument is not an airport object" do
      expect { plane.land(String.new) }.to raise_error 'argument is not an airport object'
    end
    it "expects to prevent landing if airport has a true blocked_airport attribute" do
      airport.blocked_airport = true
      expect { plane.land(airport) }.to raise_error(RuntimeError, "Plane cannot land because the airport is having technical difficulties")
    end
    it "expects to prevent landing if the plane has already landed" do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'plane has already landed...so cannot land again'
    end

  end
  describe "#take_off" do
    it "expects the plane to take off and set the in_the_air variable to true" do
      plane.take_off(airport)
      expect(plane.in_the_air?).to eq true
    end
    it "expects to prevent taking_off when airport has a true blocked_airport attribute" do
      airport.blocked_airport = true
      expect { plane.take_off(airport) }.to raise_error 'Plane cannot take off because the airport is having technical difficulties'
    end
    it "expects to prevent taking_off if a plane has already taken off" do
      plane.take_off(airport)
      expect { plane.take_off(airport) }.to raise_error 'plane is already up in the air..so cannot take off'
    end
  end

  describe "#airport_exited" do
    it "expects a plane to save airport ID after it has taken off " do
      plane.take_off(airport)
      expect(plane.airport_exited).to eq airport.__id__
    end
  end
  describe "#confirm_take_off" do
    it "expects a plane to confirm that he has exited specific airport" do
      plane.take_off(airport)
      expect(plane.confirm_take_off(airport)).to eq true
    end
    it "expects a plane to output false if we confirm_take_off the wrong airport" do
      airport2 = Airport.new("OhDear Airport")
      plane.take_off(airport)
      expect(plane.confirm_take_off(airport2)).to eq false
    end
  end
end

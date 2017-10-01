require 'plane'
require 'airport'
describe Plane do
  let(:plane) { Plane.new("Test Airport") }
  let(:airport) { Airport.new("Test Airport") }

  describe "#initialize" do
    it "expects a new Plane instance to have a new Airport object instantiated as his home airport" do
      expect(plane.home_airport.class).to eq Airport
    end
  end

  describe "#land" do
    it "expects a plane to be able to land" do
      expect(plane).to respond_to(:land)
    end
    it "expects to prevent landing if airport has a true blocked_airport attribute" do
      airport.blocked_airport = true
      expect { plane.land(airport) }.to raise_error(RuntimeError, "Plane cannot land because the airport is having technical difficulties")
    end
    it "expects to prevent landing if the plane has never taken off" do
      expect { plane.land(airport) }.to raise_error 'plane cannot land at his home airport'
    end
    it "expects to prevent landing if the plane has never taken off" do
      airport2 = Airport.new("Charles de Gaulle Airport")
      expect { plane.land(airport2) }.to raise_error 'plane is still landed, so cannot land'
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
    it "expects to prevent taking_off if plane is not taking off from his home airport" do
      airport2 = Airport.new("Galapagos airport")
      expect { plane.take_off(airport2) }.to raise_error 'plane not flying from home airport'
    end
    it "expects to prevent taking_off if plane is not taking off from airport he had landed before" do
      plane.take_off(airport)
      airport2 = Airport.new("Galapagos airport")
      plane.land(airport2)
      airport3 = Airport.new("Santiago airport")
      expect { plane.take_off(airport3) }.to raise_error(RuntimeError, 'plane not flying from correct airport')
    end
  end

  describe "#airport_exited" do
    it "expects a plane to save airport Name after it has taken off " do
      plane.take_off(airport)
      expect(plane.airport_exited).to eq airport.name
    end
  end
  describe "#confirm_take_off" do
    it "expects a plane to confirm that he has exited specific airport" do
      plane.take_off(airport)
      expect(plane.confirm_take_off).to eq "confirming take_off from #{airport.name}"
    end
  end
end

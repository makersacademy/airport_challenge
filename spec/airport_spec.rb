require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { Plane.new }
  let(:weather) { double(:weather) }

  describe "landing" do
    it "instructs a plane to land" do
      expect(airport).to respond_to(:land)
    end

    it "confirms that plane is in the airport" do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it "raises an error if plane = nil" do
      plane1 = nil
      expect { airport.land(plane1) }.to raise_error("The plane can't be nil!")
    end

    it "raises an error if the max capacity of the airport is reached" do
      airport1 = Airport.new(5)
      airport1.capacity.times { airport1.land Plane.new }
      plane1 = Plane.new
      expect { airport1.land(plane1) }.to raise_error("Maximum capacity of the airport is reached!")
    end

    it "raises an error if the same plane attempts to land" do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("This plane has already landed!")
    end

    it "does not allow plane to land if it is stormy weather" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error("The plane can't land due to stormy weather!")
    end

  end

  describe "take off" do
    it "instructs a plane to take off" do
      expect(airport).to respond_to(:take_off)
    end

    it "confirms that plane is no longer at the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it "raises an error if plane = nil" do
      plane1 = nil
      expect { airport.take_off(plane1) }.to raise_error("The plane can't be nil!")
    end

    it "raises an error if the same plane attempts to take off" do
      airport.land(plane)
      plane1 = Plane.new
      expect { airport.take_off(plane1) }.to raise_error("This plane is already flying!")
    end

    it "raises an error if there are no planes at the airport" do
      expect { airport.take_off(plane) }.to raise_error("There are no planes at the airport for take off!")
    end

    it "does not allow plane to take off if it is stormy weather" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("The plane can't take off due to stormy weather!")
    end

  end

end

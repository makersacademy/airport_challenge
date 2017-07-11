require 'airport'
#require 'plane'
# require 'weather'

describe Airport do
  subject(:airport) { described_class.new(5 , weather)}
  let (:plane) { Plane.new }
  let (:landed_plane) { double(:plane, :landed => false) }
  let (:flying_plane) { double(:plane, :landed => false) }
  let(:weather) { double(:weather, :stormy? => false)}

  describe "landing" do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
    end

    it "instructs a plane to land" do
      expect(airport).to respond_to(:land)
    end

    it "confirms that plane is in the airport" do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it "raises an error if the max capacity of the airport is reached" do
      airport.capacity.times { airport.land Plane.new }
      expect { airport.land(landed_plane) }.to raise_error("Maximum capacity of the airport is reached!")
    end
  end

  describe "take off" do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
    end

    it "instructs a plane to take off" do
      expect(airport).to respond_to(:take_off)
    end

    it "confirms that plane is no longer at the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it "raises an error if there are no planes at the airport" do
      expect { airport.take_off(plane) }.to raise_error("There are no planes at the airport for take off!")
    end
  end

  describe "stormy weather" do

    it "does not allow plane to land if it is stormy weather" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error("The plane can't land due to stormy weather!")
    end

    it "does not allow plane to take off if it is stormy weather" do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("The plane can't take off due to stormy weather!")
    end
  end

end

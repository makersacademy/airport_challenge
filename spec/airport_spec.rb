require "airport"

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { double :plane, landed: nil, land: nil, take_off: nil }

  before do
    allow(airport).to receive(:stormy?) {false}
  end
  describe "#initialize" do
    it "should ensure that the default capacity is set" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should allow the user to set the capacity" do
      expect(Airport.new(20).capacity).to eq 20
    end
  end

  describe "#land" do
    it "should raise an error if the plane is already landed" do
      allow(plane).to receive(:landed).and_return(true)
      expect { airport.land(plane) }.to raise_error("Plane is already landed")
    end

    before do
      airport.land(plane)
    end
    it "should allow the plane to land and stay landed in the airport" do
      expect(airport.planes).to include(plane)
    end

    it "should raise an error if the aiport is full" do
      airport = Airport.new(0)
      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    it "should raise an error if the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error("Bad weather - unable to land")
    end
  end

  describe "#take_off" do
    it "should raise an error if the plane is not in the aiport" do
      expect { airport.take_off(plane) }.to raise_error("Plane not in airport")
    end

    it "should allow a plane to take off and leave the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end

    it "should raise an error if the weather is stormy" do
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("Bad weather - unable to take off")
    end
  end

end

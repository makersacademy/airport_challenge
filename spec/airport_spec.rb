require 'airport'

describe Airport do
  let :plane { double :plane, flying?: true, ground: nil, fly: nil }
  subject(:airport) { Airport.new }

  describe "#capacity" do
    it "has an adjustable plane capacity" do
      airport = Airport.new(1)
      expect(airport.capacity).to eq(1)
    end

    it "prevents capacity lower than 1" do
      expect { Airport.new(0) }.to raise_error("Capacity must be greater than 1")
    end
  end

  describe "#full?" do
    it "returns true when full" do
      airport = Airport.new(1)
      airport.land(plane)
      expect(airport.full?).to eq(true)
    end
    it "returns false when not full" do
      airport = Airport.new(2)
      airport.land(plane)
      expect(airport.full?).to eq(false)
    end
  end

  describe "#land" do
    it "stores landed planes" do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

    it "won't allow landing after capacity reached" do
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    it "only lands a flying plane" do
      allow(plane).to receive(:flying?).and_return(false)
      expect { airport.land(plane) }.to raise_error("Plane is grounded")
    end

    it "changes status of plane to not flying when landing" do
      expect(plane).to receive(:ground)
      airport.land(plane)
    end
  end

  describe "#take_off" do

    before do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
    end

    it "releases planes after take-off" do
      expect(airport.planes).not_to include(plane)
    end

    it "confirms last plane departed from airport" do
      expect(airport.at_airport?(plane)).to eq(false)
    end

    it "only releases planes it contains" do
      expect { airport.take_off(plane) }.to raise_error("Plane not in airport")
    end

    it "changes status of plane to flying when taking-off" do
      airport.land(plane)
      expect(plane).to receive(:fly)
      airport.take_off(plane)
    end

    context "when stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it "prevents take-off in stormy weather" do
        airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error("Cannot take-off during a storm")
      end
    end
  end
end

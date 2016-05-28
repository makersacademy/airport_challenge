require 'airport'

describe Airport do
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new(10,weather) }
  let(:plane) { double(:plane, land: nil, take_off:nil, landed?: false) }

  context "when fair" do

    describe "#land" do
      it "tells plane to land" do
        airport.land(plane)
      end

      it "has plane after landing" do
        airport.land(plane)
        expect(airport.has?(plane)).to eq true
      end

      it "cannot land if plane already in an airport" do
        allow(plane).to receive(:landed?) { true }
        expect { airport.land(plane) }.to raise_error "Plane has already landed"
      end

      it "prevents landing if airport full" do
        small_airport = Airport.new(1)
        small_airport.land(plane)
        message = "Cannot land as airport is full"
        expect { small_airport.land(plane) }.to raise_error message
      end
    end

    describe "#take_off" do
      it "tells plane to take off" do
        airport.land(plane)
        allow(plane).to receive(:landed?) { true }
        airport.take_off(plane)
      end

      it "does not have plane after take off" do
        airport.land(plane)
        allow(plane).to receive(:landed?) { true }
        airport.take_off(plane)
        expect(airport.has?(plane)).to eq false
      end

      it "error if plane not in this airport" do
        allow(plane).to receive(:landed?) { true }
        message = "Plane is not at this airport"
        expect { airport.take_off(plane) }.to raise_error message
      end
    end
  end

  context "when stormy" do

    it "prevents take-off" do
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      allow(plane).to receive(:landed?) { true }
      message = "Plane cannot take off due to storm"
      expect { airport.take_off(plane) }.to raise_error message
    end

    it "prevents landing" do
      allow(airport).to receive(:stormy?) { true }
      message = "Plane cannot land due to storm"
      expect { airport.land(plane) }.to raise_error message
    end
  end
end

require 'airport'

describe Airport do
  subject(:airport) { Airport.new(10) }
  let(:plane) { double("a plane") }

  describe "#land" do
    context "when not stormy" do
      before :each do
        allow(airport).to receive(:stormy?).and_return false
      end

      context "when not at capacity" do
        it "returns plane when landed" do
          expect(airport.land(plane)).to include plane
        end
      end

      context "when at capacity" do
        before :each do
          10.times { airport.land(plane) }
        end

        it "raises 'Airport at capacity' error" do
          expect { airport.land(plane) }.to raise_error "Airport at capacity"
        end
      end
    end

    context "when stormy" do
      it "raises 'Too stormy to land' error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Too stormy to land"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before :each do
        allow(airport).to receive(:stormy?).and_return false
      end

      context "when plane is landed in airport" do
        before :each do
          airport.land(plane)
        end

        it "removes plane from airport and returns planes array" do
          expect(airport.take_off(plane)).not_to include plane
        end
      end

      context "when plane is not landed in airport" do
        it "raises 'Plane not in this airport' error" do
          expect { airport.take_off(plane) }.to raise_error "Plane not in this airport"
        end
      end
    end

    context "when stormy" do
      it "raises 'Too stormy to take off' error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Too stormy to take off"
      end
    end
  end
end

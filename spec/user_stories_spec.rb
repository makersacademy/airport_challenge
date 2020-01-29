require "airport"
require "plane"

describe Airport do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }
  context "when not stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    it "instructs a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

    it "instructs a plane to take off" do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    context "when airport is full" do
      it "does not allow planes to land" do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "cannot land when airport full"
      end
    end
  end

  context "when weather is stormy" do
    it "does not allow planes to land" do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "cannot land plane when stormy"
    end
  end
end

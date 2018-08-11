require 'airport'

describe Airport do
  let(:airport)   { Airport.new }
  let(:mockplane) { double :plane }

  describe "#initialize" do
    it "sets capacity at default value when no argument is provided" do
      expect(airport.capacity).to eq DEFAULT_CAPACITY
    end

    it "sets variable capacity when argument is provided" do
      expect(Airport.new(25).capacity).to eq 25
    end

  end

  describe "#land" do
    it "accepts plane object" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    describe "when weather is not stormy" do
      it "puts plane in the hanger" do
        allow(airport).to receive(:stormy?) { false }
        airport.land(mockplane)
        expect(airport.hanger).to eq [mockplane]
      end

      it "does not put plane in hanger if hanger is full" do
        allow(airport).to receive(:stormy?) { false }
        DEFAULT_CAPACITY.times { airport.land(mockplane) }
        expect { airport.land(mockplane) }.to raise_error("Hanger is full - plane can't land!")
      end
    end

    describe "when weather is stormy" do
      it "does not put plane in hanger" do
        allow(airport).to receive(:stormy?) { true }
        expect { airport.land(mockplane) }.to raise_error("Stormy weather - plane can't land!")
      end
    end
  end

  describe "#take_off" do
    describe "when weather is not stormy" do
      it "plane does take off" do
        allow(airport).to receive(:stormy?) { false }
        expect { airport.take_off(mockplane) }.not_to raise_error
      end

      it "plane is taken from hanger" do
        allow(airport).to receive(:stormy?) { false }
        airport.take_off(mockplane)
        expect(airport.hanger).not_to include(mockplane)
      end
    end

    describe "when weather is stormy" do
      it "plane does not take off" do
        allow(airport).to receive(:stormy?) { true }
        expect { airport.take_off(mockplane) }.to raise_error("Stormy weather - plane can't take off!")
      end

      it "plane not taken from hanger" do
        allow(airport).to receive(:stormy?) { true }
        #expect(airport.take_off(mockplane).hanger).to contain(mockplane)
      end
    end
  end

end

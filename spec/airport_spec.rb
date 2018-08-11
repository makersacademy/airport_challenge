require 'airport'

describe Airport do
  let(:airport)   { Airport.new }
  let(:mockplane) { double :plane }

  describe "#land" do
    it "accepts plane object" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "puts plane in the hanger when not stormy" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(mockplane)
      expect(airport.hanger).to eq [mockplane]
    end

    it "stormy weather prevents plane landing" do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(mockplane) }.to raise_error("Stormy weather - plane can't land!")
    end

    it "prevents planes landing if hanger is full and not stormy" do
      allow(airport).to receive(:stormy?) { false }
      10.times { airport.land(mockplane) }
      expect { airport.land(mockplane) }.to raise_error("Hanger is full - plane can't land!")
    end

  end

  describe "#take_off" do
    it "takes plane from hanger when not stormy" do
      allow(airport).to receive(:stormy?) { false }
      airport.take_off(mockplane)
      expect(airport.hanger).not_to include(mockplane)
    end

    it "stormy weather prevents plane taking off" do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(mockplane) }.to raise_error("Stormy weather - plane can't take off!")
    end
  end

  describe "#random" do
    it "returns random numbers between 1 and 10" do
      expect(airport.random).to be_between(1, 100).inclusive
    end
  end

end

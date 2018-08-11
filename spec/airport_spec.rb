require 'airport'

describe Airport do
  let(:airport)         { Airport.new }
  let(:mockplane)       { double :plane }
  let(:weather)         { double :goodweather, stormy?: false }
  let(:mockbadweather)  { double :badweather, stormy?: true }

  describe "#initialize" do
    it "sets capacity at default value when no argument is provided" do
      expect(airport.capacity).to eq DEFAULT_CAPACITY
    end

    it "sets variable capacity when argument is provided" do
      expect(Airport.new(25).capacity).to eq 25
    end

  end

  describe "#put_in_airport" do
    it "accepts plane object" do
      expect(airport).to respond_to(:put_in_airport).with(1).argument
    end

    describe "when weather is not stormy" do
      it "puts plane in the airport" do
        allow(weather).to receive(:stormy?).and_return(false)
        airport.put_in_airport(mockplane)
        airport(airport.planes).to eq [mockplane]
      end

      it "does not put plane in airport if airport is full" do
        allow(weather).to receive(:stormy?).and_return(false)
        DEFAULT_CAPACITY.times { airport.put_in_airport(mockplane) }
        expect { airport.put_in_airport(mockplane) }.to raise_error("Airport is full - plane can't land!")
      end
    end

    describe "when weather is stormy" do
      it "does not put plane in airport" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { airport.put_in_airport(mockplane) }.to raise_error("Stormy weather - plane can't land!")
      end
    end
  end

  describe "#take_off" do
    describe "when weather is not stormy" do
      it "plane does take off" do
        allow(weather).to receive(:stormy?).and_return(false)
        expect { airport.take_from_airport(mockplane) }.not_to raise_error
      end

      it "plane is taken from airport" do
        allow(weather).to receive(:stormy?).and_return(false)
        airport.take_from_airport(mockplane)
        expect(airport.planes).not_to include(mockplane)
      end
    end

    describe "when weather is stormy" do
      it "plane does not take off" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { airport.take_from_airport(mockplane) }.to raise_error("Stormy weather - plane can't take off!")
      end

      it "plane not taken from airport" do
        allow(weather).to receive(:stormy?).and_return(true)
        # expect(airport.take_off(mockplane).planes).to contain(mockplane)
      end
    end
  end

end

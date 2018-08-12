require 'airport'

describe Airport do
  let(:airport)     { Airport.new }
  let(:mockplane)   { double :plane, landing: true, taking_off: true }
  let(:mockplane2)  { double :plane2, landing: true, taking_off: true }

  describe "#initialize" do
    it "sets capacity at default value when no argument is provided" do
      expect(airport.capacity).to eq DEFAULT_CAPACITY
    end

    it "sets variable capacity when argument is provided" do
      expect(Airport.new(25).capacity).to eq 25
    end

  end

  describe "#put_in_airport" do
    describe "when weather is not stormy" do
      before(:each) do
        allow(airport.weather).to receive(:stormy?).and_return(false)
      end

      it "puts plane in the airport" do
        airport.land(mockplane)
        expect(airport.planes).to eq [mockplane]
      end

      it "does not put plane in airport if airport is full" do
        DEFAULT_CAPACITY.times { airport.land(mockplane) }
        expect { airport.land(mockplane) }.to raise_error("Airport is full - plane can't land!")
      end
    end

    describe "when weather is stormy" do
      it "does not put plane in airport" do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        expect { airport.land(mockplane) }.to raise_error("Stormy weather - plane can't land!")
      end
    end
  end

  describe "#take_from_airport" do
    describe "when weather is not stormy" do

      before(:each) do
        allow(airport.weather).to receive(:stormy?).and_return(false)
      end

      it "plane does take off" do
        expect { airport.take_off(mockplane) }.not_to raise_error
      end

      it "correct plane is taken from airport" do
        airport.land(mockplane)
        airport.land(mockplane2)
        airport.take_off(mockplane)
        expect(airport.planes).not_to include(mockplane)
      end
    end

    describe "when weather is stormy" do
      it "plane does not take off" do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        expect { airport.take_off(mockplane) }.to raise_error("Stormy weather - plane can't take off!")
      end

      it "plane not taken from airport" do
        # Not super happy with this test
        # I want to generate an error and then check my planes array
        # So I end up having two 'expects' in one 'it' block
        allow(airport.weather).to receive(:stormy?).and_return(false)
        airport.land(mockplane)
        allow(airport.weather).to receive(:stormy?).and_return(true)
        expect { airport.take_off(mockplane) }.to raise_error("Stormy weather - plane can't take off!")
        expect(airport.planes).to include(mockplane)
      end
    end
  end

end

require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe 'Initalisation' do
    it 'airplane instance takes capacity as an argument' do
      gatwick = Airport.new(40)
      expect(gatwick.capacity).to eq(40)
    end

    it 'if no argument is given, default capacity is 125' do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe 'Landing' do
    context 'normal weather' do
      before do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      end

      it { is_expected.to respond_to(:land).with(1).argument }

      it 'adds plane to bunker when landed' do
        airport.land(Plane.new)
        expect(airport.bunker.length).to eq(1)
      end

      it 'raises error if plane tries to land when airport is full' do
        expect { 130.times { airport.land(Plane.new) } }.to raise_error("Do not land, airport is full")
      end

      it 'raises error if a landed plane is asked to land' do
        gatwick = Airport.new
        plane = Plane.new
        gatwick.land(plane)
        expect { gatwick.land(plane) }.to raise_error("Plane has already landed")
      end
    end

    context 'stormy weather' do
      before do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      end

      it 'raises error for landing if stormy' do
        plane = Plane.new
        expect { airport.land(plane) }.to raise_error("Arrival delayed: stormy weather")
      end
    end
  end

  describe 'Taking off' do
    context "normal weather" do
      before do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      end

      it 'removes plane from bunker when taking off' do
        EZ101 = Plane.new
        airport.land(EZ101)
        airport.takeoff(EZ101)
        expect(airport.bunker).to be_empty
      end

      it 'raises error if plane tries to takeoff when already in flight' do
        gatwick = Airport.new
        EZ104 = Plane.new
        gatwick.land(EZ104)
        gatwick.takeoff(EZ104)
        expect { airport.takeoff(EZ104) }.to raise_error("Plane has taken off")
      end

      it 'raises error if plane is not at the airport' do
        plane = Plane.new
        gatwick = Airport.new
        heathrow = Airport.new
        gatwick.land(plane)
        gatwick.takeoff(plane)
        heathrow.land(plane)
        expect { gatwick.takeoff(plane) }.to raise_error("Plane not grounded at this airport")
      end
    end

    context 'stormy weather' do
      before do
        plane = Plane.new
        airport.land(plane)
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      end

      it 'returns error message when plane attempts to take off in storm' do
        expect { airport.takeoff(plane) }.to raise_error("Departure delayed: stormy weather")
      end
    end
  end
end

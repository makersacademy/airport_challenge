require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'gives the default capacity when no arguments are given' do
      expect(airport.capacity).to eq(Airport::MAXCAPACITY)
    end

    it 'gives the specified capacity when an argument is given' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq(10)
    end

    it 'the hangar is empty' do
      expect(airport.hangar).to be_empty
    end
  end

  describe '#full?' do
    it 'returns true if the hangar is full' do # unhappy path
      #wx = double(Weather)
      #allow(wx).to receive(:stormy) { nil }
      airport1 = Airport.new(1)
      airport1.land(plane)
      expect(airport1.full?).to be(true)
    end

    it 'returns nil if the hangar is not full' do # happy path
      #wx = double(Weather)
      #allow(wx).to receive(:stormy) { nil }
      airport2 = Airport.new(2)
      airport2.land(plane)
      expect(airport2.full?).to be(nil)
    end
  end

  describe '#land' do
    context 'everything goes according to plan' do
      it 'the landed plane returns true' do #written for me - ignores wx
        airport.land(plane)
        expect(plane.landed).to be(true)
      end

      it 'the plane is in the hangar' do # happy path
        airport.land(plane)
        expect(airport.hangar).to include(plane)
      end
    end

    context 'something goes wrong' do
      xit 'the plane does not land if it is too stormy' do

      end

      it 'the plane does not land if it has already landed' do
        airport.land(plane)
        expect{airport.land(plane)}.to raise_error.with_message("That plane has already landed")
      end

      it 'the plane does not land if the airport is full' do
        airport1 = Airport.new(1)
        plane2 = Plane.new
        airport1.land(plane)
        expect{airport1.land(plane2)}.to raise_error.with_message("The airport is full")
      end
    end
  end

  describe '#take_off' do
    context 'everything goes according to plan' do
      it 'the plane returns false' do # happy path - this one has a double
        #wx = double(Weather) #why isn't this double working?
        #allow(wx).to receive(:stormy) { nil }

        #wx = double(Weather.new)
        #allow(wx).to receive(:stormy) { nil }

        airport.land(plane)
        airport.take_off(plane)
        expect(plane.landed).to be(false)
      end

      it 'the plane is not in the hangar' do # happy path
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.hangar).not_to include(plane)
      end
    end

    context 'something goes wrong' do
      xit 'the plane does not take-off if it is too stormy' do

      end

      it 'the plane does not take-off if it has already taken off' do
        airport.land(plane)
        airport.take_off(plane)
        expect{airport.take_off(plane)}.to raise_error.with_message("That plane has already taken off")
      end
    end
  end

end

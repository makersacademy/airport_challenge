require 'airport'

describe Airport do
  describe '#can_land?' do
    context "weather is sunny" do
      srand(0) # sunny weather
      it 'returns true if the airport is not full' do
        expect(subject.can_takeoff?).to be true
      end
      it 'returns false if airport is full' do
        Airport::DEFAULT_CAPACITY.times{ subject.landing(Plane.new) }
        expect(subject.can_land?).to be false
      end
      it 'returns true if airport is not full in big airport' do
        big_airport = Airport.new(500)
        499.times{ big_airport.landing(Plane.new) }
        expect(big_airport.can_land?).to be true
      end
      it 'returns false if airport is full in big airport' do
        big_airport = Airport.new(500)
        500.times{ big_airport.landing(Plane.new) }
        expect(big_airport.can_land?).to be false
      end
    end
    it 'returns false if weather is stormy' do
      srand(13) # stormy weather
      expect(subject.can_land?).to be false
    end
  end

  describe '#can_takeoff?' do
    it 'returns true in sunny weather' do
      srand(0) # sunny weather
      expect(subject.can_takeoff?).to be true
    end
    it 'returns false in stormy weather' do
      srand(13) # stormy weather
      expect(subject.can_takeoff?).to be false
    end
  end
end

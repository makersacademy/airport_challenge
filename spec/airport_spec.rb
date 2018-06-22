require 'airport'

describe Airport do
  describe '#can_land?' do
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
  describe '#can_takeoff?' do
    it 'can tell a plane if it can take off' do
      expect(subject.can_takeoff?).to be true
    end
  end
end

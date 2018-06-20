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
  end
  describe '#can_takeoff?' do
    it 'can tell a plane if it can take off' do
      expect(subject.can_takeoff?).to be true
    end
  end
  describe '#landing' do
    it 'increments the number of planes in airport' do

    end
  end
end

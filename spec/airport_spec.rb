require 'airport'
require 'plane'

describe Airport do
  describe '#hanger_full?' do
    context 'hanger is not full' do
      it 'detects when hanger is not full' do
        expect(subject.hanger_full?).to be false
      end

    end

    context 'hanger is full' do
      it 'detects when hanger is full' do
        # Would like to test when an airport has a randomized capacity
        # and is full, but no idea how to do this while not having a 
        # hanger accessor method?
        airport = Airport.new(0)
        expect(airport.hanger_full?).to be true
      end
    end
  end
end

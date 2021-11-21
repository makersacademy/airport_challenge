require 'airport'

describe Airport do
  describe '#hanger_full?' do
    context 'hanger is full' do
      it 'returns true' do
        airport = Airport.new(0)
        expect(airport.hanger_full?).to be true
      end
    end

    context 'hanger is not full' do
      it 'returns false' do
        airport = Airport.new
        expect(airport.hanger_full?).to be false
      end
    end
  end
end

require 'airport'

describe Airport do
  let(:airport) {Airport.new}


  describe '#initalization' do
    it 'gets a random weather on initalization' do
      expect(airport.weather == "sunny" || airport.weather == "stormy").to eq(true)
    end
    it 'doesn\'t contain too many planes on initalization' do
      expect(airport.full?).to eq(false)
    end
  end
end

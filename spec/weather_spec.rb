require 'weather'

describe Weather do
  subject(:weather) { Weather.new }
  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    it 'returns not stormy(false) when rand returns less than less than or equal to 3' do
      allow(weather).to receive(:rand).and_return(3)
      expect(weather.stormy?).to eq false
    end
    it 'returns stormy(true) when rand returns number of 4 or above' do
      allow(weather).to receive(:rand).and_return(4)
      expect(weather.stormy?).to eq true
    end
  end
end

require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#stormy?' do

    it 'returns true when the weather is stormy' do
      allow(weather).to receive(:rand).and_return(5)
      expect(weather.stormy?).to eq true
    end

    it 'returns false when the weather is not stormy' do
      allow(weather).to receive(:rand).and_return(7)
      expect(weather.stormy?).to eq false
    end

  end

end

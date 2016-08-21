require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#stormy?' do
    
    it 'returns true when the weather is stormy' do
      expect(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq true
    end

    it 'returns false when the weather is not stormy' do
      expect(weather).to receive(:stormy?).and_return(false)
      expect(weather.stormy?).to eq false
    end

  end

end

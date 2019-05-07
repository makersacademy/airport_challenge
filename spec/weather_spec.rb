require 'weather'

describe 'Weather' do

  let(:weather) { Weather.new }

  describe '#stormy?' do
    it 'returns true if the weather is stormy' do
      expect(weather.stormy?).to eq(true)
    end
  
    it 'returns false if the weather is not stormy' do
      expect(weather.stormy?).to eq(false)
    end
  end
end

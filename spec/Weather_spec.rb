require 'Weather'

describe Weather do

  describe '#stormy?' do
    it 'states if weather is stormy or not' do
      expect(Weather.stormy?).to eq true || false
    end
  end
end

require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns true when srand is run' do
      srand 1
      weather = Weather.new
      expect(weather.stormy?).to eq true
    end
  end
end 

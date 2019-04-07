require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'checks if the forecast is stormy or not' do
      weather = Weather.new
      allow(weather).to receive(:forecast).and_return(2)
      expect(weather.stormy?).to eq false
    end
  end

end

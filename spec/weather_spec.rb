require 'weather'

describe Weather do
  weather = Weather.new
    it { is_expected.to respond_to(:stormy?) }
 
    it 'can create random non-stormy weather' do
      allow(weather).to receive(:random_weather).and_return((Weather::STORM_CONSTANT) + 1)
      expect(weather.stormy?).to eq false
    end

    it 'can create random non-stormy weather' do
      allow(weather).to receive(:random_weather).and_return(Weather::STORM_CONSTANT)
      expect(weather.stormy?).to eq true
    end
end
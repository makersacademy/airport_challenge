require 'weather_forecast'

describe WeatherForecast do

  subject(:weather_forecast) { WeatherForecast.new }

  describe '#stormy?' do
    it 'will not be stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_forecast.stormy?).to be false
    end
    it 'will be stormy' do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather_forecast.stormy?).to be true
    end
  end
end
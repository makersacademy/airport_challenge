require 'weather_station'

describe WeatherStation do
  describe '#stormy?' do
    it 'returns either true or false' do
      weather = WeatherStation.new
      expect([true, false]).to include weather.stormy?
    end
  end
end

require 'weather_station'

describe WeatherStation do
  describe '.status' do
    it 'returns either ⛈ or ☀️' do
      weather = WeatherStation.new
      expect(["☀️", "⛈"]).to include weather.status
    end
  end
end

require 'weather_forecaster'

describe WeatherForecaster do
  describe '.forecast' do
    it 'returns either ⛈ or ☀' do
      weather = WeatherForecaster.new
      expect(["⛈","☀"]).to include (weather.forecast)
    end
  end
end
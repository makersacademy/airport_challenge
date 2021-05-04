require './lib/weather_forecaster.rb'

describe WeatherForecaster do
  describe 'current' do
    it 'returns either "Stormy" or "Sunny"' do
      # not the best test, could only return 'Stormy' and still pass
      weather = ['Stormy', "Sunny"]
      expect(weather.include?(subject.current)).to eq(true)
    end
  end
end

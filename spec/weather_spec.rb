require './lib/weather_forecaster.rb'

describe WeatherForecaster do
  describe 'get_current' do
    it 'returns either "Stormy" or "Sunny"' do
      #not the best test, could only return 'Stormy' and still pass
      weather = ['Stormy', "Sunny"]
      expect(weather.include?(subject.get_current)).to eq(true)
    end
  end
end
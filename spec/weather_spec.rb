require './lib/weather_forecaster.rb'

describe WeatherForecaster do
  describe '#current' do
    it 'returns either "Stormy" or "Sunny"' do
      srand(111)
      result = 10.times.map { subject.current } 
      expected = ['Sunny', 'Sunny', 'Sunny', 'Sunny', 'Sunny', 'Stormy', 'Sunny', 'Sunny', 'Sunny', 'Sunny']
      expect(result).to eq(expected)
    end
  end
end

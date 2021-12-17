require 'weather_service'

describe WeatherService do
  describe '.alert?' do
    it 'returns a Boolean value' do 
      expect([true, false]).to include WeatherService.alert?
    end
  end
end

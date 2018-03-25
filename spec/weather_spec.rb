require 'weather'

describe Weather do

  describe '#current_weather' do

    it 'return sunny or stormy by random' do
      weather = Weather.new
      weather_for_now = weather.current_weather
      expect(weather.weather).to include(weather_for_now)
    end
  end
end

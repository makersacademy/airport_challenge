require 'weather'

class WeatherModule
  include Weather
end

RSpec.describe WeatherModule do
  context '#weather_report' do
    it 'should report if the weather is stormy or not' do
      expect([:stormy, :clear]).to include(subject.weather_report)
    end
  end
end

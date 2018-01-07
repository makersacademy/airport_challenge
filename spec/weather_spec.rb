require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#initialize' do
    it 'has a valid weather' do
      expect(Weather::WEATHER_CONDITIONS).to include weather.current_weather
    end
  end

  describe '#get_weather' do
    it 'returns current weather' do
      expect(Weather::WEATHER_CONDITIONS).to include weather.return_weather
    end
  end
end

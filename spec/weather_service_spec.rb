require 'weather_service'

describe WeatherService do
  subject(:weather_service) { described_class.new }

  describe '#stormy?' do
    it 'can be non-stormy' do
      expect(weather_service.stormy?).to be false
    end
  end
end

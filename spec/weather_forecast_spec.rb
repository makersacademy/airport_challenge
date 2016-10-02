require 'spec_helper'

describe WeatherForecast do
  subject(:weather_forecast) { described_class.new }

  describe '#stormy?' do
    it 'can be not stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_forecast.stormy?).to be false
    end

    it 'can be stormy' do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather_forecast.stormy?).to be true
    end
  end
end

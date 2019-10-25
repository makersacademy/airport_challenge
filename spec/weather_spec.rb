require 'airport'
require 'plane'
require 'weather'

describe Weather do
  subject(:weather_forecast) { Weather.new }

  describe '#sunny' do
    it 'weather can be sunny' do
      allow(subject).to receive(:sunny).and_return true
      expect(weather_forecast.sunny).to be true
    end
    it 'weather can be stormy (non-sunny)' do
      allow(subject).to receive(:sunny).and_return false
      expect(weather_forecast.sunny).to be false
    end
  end
end

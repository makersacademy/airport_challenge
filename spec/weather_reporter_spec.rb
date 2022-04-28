require 'weather_reporter'

describe WeatherReporter do
  subject(:weather_reporter) { described_class.new }

  describe '#stormy' do
    it 'weather can be non-stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_reporter.stormy?).to be false
    end
    it 'weather can be stormy' do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather_reporter.stormy?).to be true
    end
  end
end
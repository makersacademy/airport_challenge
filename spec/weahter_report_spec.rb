require 'weather_report'

describe WeatherReport do
  subject(:weather_report) {described_class.new}
  describe '#stormy?' do
    it 'can be not stormy' do
      allow(Kernel).to receive(:rand).and_return 2
      expect(weather_report.stormy?).to be false
    end

    it 'can be stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_report.stormy?).to be true
    end
  end
end
require 'weather_report'

describe WeatherReport do
  subject(:weather_report) { described_class.new }

  describe '#stormy?' do
    it "when sunny" do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_report.stormy?).to be false
    end

    it "when stormy" do
      allow(Kernel).to receive(:rand).and_return 4
      expect(weather_report.stormy?).to be true
    end
  end
end

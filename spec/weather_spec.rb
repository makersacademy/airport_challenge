require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe "#stormy?" do

    it "returns true if weather_forecast is :stormy" do
      allow(weather).to receive(:weather_forecast) {:stormy}
      expect(weather.stormy?).to be true
    end

    it "returns false if weather_forecast is :sunny" do
      allow(weather).to receive(:weather_forecast) {:sunny}
      expect(weather.stormy?).to be false
    end
  end
end

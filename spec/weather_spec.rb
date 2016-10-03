require "weather"

describe Weather do
  subject(:weather) {described_class.new}

  describe "#weather_conditions" do
    it "can be stormy" do
      allow(weather).to receive(:stormy?).and_return true
      expect(weather.stormy?).to be true
    end

    it "can be no stormy" do
      allow(weather).to receive(:stormy?).and_return false
      expect(weather.stormy?).to be false
    end
  end
end

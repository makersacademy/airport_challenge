require 'weather'

describe Weather do

  describe "#stormy?" do

    it "returns true if weather_forecast is :stormy" do
      allow(subject).to receive(:weather_forecast) {:stormy}
      expect(subject.stormy?).to be true
    end

    it "returns false if weather_forecast is :sunny" do
      allow(subject).to receive(:weather_forecast) {:sunny}
      expect(subject.stormy?).to be false
    end
  end
end

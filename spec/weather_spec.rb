require "weather"

describe Weather do
  subject(:weather) { described_class.new }

    it "tests for a weather class" do
      expect(weather.class).to eq(Weather)
    end

  context "Set Weather" do
    it "expects weather to respond to a method called set_weather_integer" do
      expect(weather).to respond_to(:set_weather_integer)
    end

    it "expects the weather to be set between 0 and 100" do
      expect(weather.set_weather_integer).to be_within(50).of(50)
    end

    it "expects weather to respond to a method called stormy?" do
      expect(weather).to respond_to(:stormy?)
    end

    it "expects stormy? to be true if it is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather).to be_stormy
    end

    it "expects stormy? to be false if it is not stormy" do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather).not_to be_stormy
    end
  end
end

require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe "#stormy?" do
    it "returns true if stormy is picked" do
      allow(weather).to receive(:random_weather) { :stormy }
      expect(weather.stormy?).to eq true
    end

    it "returns false otherwise" do
      allow(weather).to receive(:random_weather) { :fine }
      expect(weather.stormy?).to eq false
    end
  end

  describe "#random_pick" do
    it "returns either stormy or fine" do
      expect(weather.random_weather).to eq(:stormy).or eq(:fine)
    end
  end
end

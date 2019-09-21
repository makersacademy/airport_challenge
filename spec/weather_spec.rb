require "weather"

describe Weather do
  describe "#stormy?" do
    it "returns true if weather is stormy" do
      current_weather = Weather.new
      expect(current_weather.stormy?).to eq true
    end
  end
end

require "weather"

describe Weather do
  let(:weather_class) { Class.new { include Weather } }
  let(:weather) { weather_class.new }

  describe "#generate_weather" do
    it "is expected to return sunny " do
      expect(weather.generate_weather).to eq "sunny"
    end
  end
end

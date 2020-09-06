require "weather"

describe Weather do
  let(:weather_class) { Class.new { include Weather } }
  let(:weather) { weather_class.new }

  describe "#generate_weather" do
    it "is expected to return sunny" do
      srand(1) # this is random behaviour, this seed gives sunny
      expect(weather.generate_weather).to eq "sunny"
    end

    it "is expected to return stormy" do
      srand(3) # this is random behaviour, this seed gives stormy
      expect(weather.generate_weather).to eq "stormy"
    end
  end
end

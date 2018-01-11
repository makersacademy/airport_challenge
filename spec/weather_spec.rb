require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe "#initialize" do
    it "should set weather to one of available types" do
      expect(Weather::WEATHER_TYPES).to include subject.current_weather
    end
  end

  describe "#stormy?" do
    it "should return true if current weather == stormy" do
      weather.instance_variable_set(:@current_weather, :stormy)
      expect(weather).to be_stormy
    end
  end

end

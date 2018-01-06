require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe "#initialize" do
    it "should set weather to one of available types" do
      expect(Weather::WEATHER_TYPES).to include subject.current_weather
    end
  end

  describe "#stormy?" do
    before { subject.instance_variable_set(:current_weather, :stormy)}
    it "should return true if current weather == stormy" do
      expect(subject).to be_stormy
    end
  end

end

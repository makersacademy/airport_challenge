require 'weather'

class WeatherDummy
  include Weather
end

RSpec.describe WeatherDummy do
  it "should report the weather" do
    expect(subject).to respond_to(:weather_report)
  end

  context "when reporting weather" do
    it "should report if the weather is stormy" do
      expect(["stormy", "clear"]).to include(subject.weather_report)
    end
  end
end

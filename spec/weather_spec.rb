require "weather"

class WeatherHolder; include Weather; end

describe "Weather" do
  it "has a weather" do
    weather_holder = WeatherHolder.new
    expect(weather_holder.stormy?.nil?).to be false
  end
end

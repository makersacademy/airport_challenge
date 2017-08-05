require "weather.rb"

describe Weather do

  it "has a list of possible weather conditions" do
    expect(Weather.weather_conditions).to eq(["partly cloudy", "cloudy", "partly sunny", "sunny", "windy", "stormy"])
  end

  it "initializes with a weather condition" do
    expect(Weather.weather_conditions).to include(subject.condition)
  end

  it "checks current weather" do
    weather = Weather.new
    expect(weather.current_weather).to eq(weather.condition)
  end
end

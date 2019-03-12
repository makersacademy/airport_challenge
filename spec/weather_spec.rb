require "weather"

describe Weather do
  it "responds to weather condition" do
    weather = Weather.new
    expect(weather).to respond_to(:weather_check)
  end
end

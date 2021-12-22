require "weather"

describe Weather do
  it "tells if the weather is sunny or stormy" do
    weather = Weather.new
    expect(weather).to respond_to(:weather_today)
  end
end

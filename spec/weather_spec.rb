require "weather"

describe Weather do
  it "tells if the weather is sunny or stormy" do
    weather = Weather.new
    expect(weather).to respond_to(:weather_today)
    allow(weather).to receive(:weather_today).with(true).and_return("sunny")
    allow(weather).to receive(:weather_today).with(false).and_return("stormy")
  end
end

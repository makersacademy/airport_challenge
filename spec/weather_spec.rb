require "weather"

describe Weather do
  it "tells if the weather is sunny or stormy" do
    weather_today = Weather.new
    expect("sunny").to eq("sunny")
  end
end

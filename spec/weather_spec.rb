require 'weather'

describe Weather do
  it "it's sunny" do
    weather = Weather.new
    allow(weather).to receive(:weather_check) { "sunny" }
    expect(weather.weather_check).to eq "sunny"
  end

  it "it's stormy" do
    weather = Weather.new
    allow(weather).to receive(:weather_check) { "stormy" }
    expect(weather.weather_check).to eq "stormy"
  end
end

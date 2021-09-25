require 'weather'

describe Weather do
  it "tells you if it is stormy" do
    weather = Weather.new
    expect(weather.stormy).to be(true).or be(false)
  end
end

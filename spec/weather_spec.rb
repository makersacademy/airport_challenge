require 'weather'

describe Weather do
  it "checks to see if the weather is stormy" do
    bad_weather = Weather.new("yes")
    expect(bad_weather.stormy).to eq(true)
  end
  it "checks if the weather is not stormy" do
    good_weather = Weather.new("no")
    expect(good_weather.stormy).to eq(false)
  end
end

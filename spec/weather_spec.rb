require "weather"

describe Weather do
  it "can be sunny or stormy" do
    weather = Weather.new
    expect(["sunny", "stormy"]).to include(weather.forecast)
  end

  it "knows if it is stormy" do
    @weather = Weather.new
    allow(@weather).to receive(:forecast) {"stormy"}
    expect(@weather.stormy?).to eq(true)
  end

  it "assigns weather randomly" do
    weather = Weather.new
    allow(weather).to receive(:random_index) {0}
    expect(weather.forecast).to eq("sunny")
  end

end

require "weather"

describe Weather do
  it "can be sunny or stormy" do
  weather = Weather.new
  expect(["sunny", "stormy"]).to include(weather.forecast)
  end
end

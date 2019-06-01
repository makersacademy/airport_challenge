require "weather"

describe Weather do
  it "can be sunny or stormy" do
  weather = Weather.new
  expect(["sunny", "stormy"]).to include(weather.forecast)
  end

  # it "assigns weather randomly" do
  # weather = Weather.new
  # allow(rand).to receive(:index) {0}
  # expect(weather.forecast).to eq("sunny")
  # allow(weather).to receive(:index) {1}
  # expect(weather.forecast).to eq("stormy")
  # end
end

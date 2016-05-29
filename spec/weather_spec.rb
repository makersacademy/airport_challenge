require 'weather'

describe Weather do
  let(:weather) {double :weather}

  it "stormy? returns true" do
  allow(weather).to receive(:weather_forecast).and_return(true)
  allow(weather).to receive(:stormy?).and_return(true)
  expect(weather.stormy?).to eq weather.weather_forecast
  end

end

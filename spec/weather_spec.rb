require 'weather'

describe Weather do
  subject(:weather) {Weather.new}

  it "checks for stormy weather" do
    allow(weather).to receive(:weather_now) {0}
    expect(weather.stormy?).to eq(true)
    allow(weather).to receive(:weather_now) {1}
    expect(weather.stormy?).to eq(false)
  end

end

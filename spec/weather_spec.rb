require 'weather'

describe Weather do
  it "says that it is stormy if the weather matches current definition of bad weather" do
    weather = Weather.new
    allow(weather).to receive(:check_weather) { Weather::BAD_WEATHER }
    expect(weather.stormy?).to eq(true)
  end

  it "generates random weather" do
    expect(subject.check_weather).to be_between(0, 99)
  end
end

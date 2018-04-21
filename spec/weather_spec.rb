require './docs/weather.rb'

describe Weather do
  weather = Weather.new
  it "should be stormy when weather_generator is 1" do
    allow(weather).to receive(:weather_generator) { 1 }
    expect(weather.stormy?).to be true
  end
  it "should be sunny when weather_generator is 0" do
    allow(weather).to receive(:weather_generator) { 0 }
    expect(weather.stormy?).to be false
  end
end

require "weather"

describe Weather do
  
  it "reports stormy when @condition is set to 8" do
    weather = Weather.new
    expect(weather.stormy?).to be true
  end
end

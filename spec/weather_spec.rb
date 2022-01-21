require "weather"

describe Weather do

  it "weather can be stormy" do
    stormy_weather = double("weather")
    allow(stormy_weather).to receive(:stormy?).and_return(true)
    expect(stormy_weather.stormy?).to eq(true)
  end

  it "weather can be clear" do
    clear_weather = double("weather")
    allow(clear_weather).to receive(:stormy?).and_return(false)
    expect(clear_weather.stormy?).to eq(false)
  end
end

require "weather"

describe Weather do
  it "should output true if the weather is stormy" do
    weather = Weather.new
    allow(weather).to receive(:outlook).and_return(:stormy)
    expect(weather.stormy?).to eq(true)
  end
end

    
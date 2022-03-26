require_relative '../lib/weather'

describe Weather do
  let(:weather) { Weather.new }

  it "has sunny weather outcomes" do
    expect(weather.random_weather).to eq(:sunny).or eq(:stormy)
  end
end

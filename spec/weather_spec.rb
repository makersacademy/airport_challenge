require_relative '../lib/weather'

describe Weather do
  let(:weather) { Weather.new }

  it "returns current weather conditions" do
    expect(weather.current_conditions).to eq(:sunny).or eq(:stormy)
  end
end

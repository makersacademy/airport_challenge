require 'weather'

describe Weather do
  it 'returns clear when weather is clear' do
    expect(Weather.weather_forecast).to eq(:clear).or eq(:stormy)
  end
end

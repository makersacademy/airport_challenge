require 'weather'

describe Weather do
  it 'returns either clear or stormy' do
    expect(Weather.weather_forecast).to eq :clear || :stormy
  end
end
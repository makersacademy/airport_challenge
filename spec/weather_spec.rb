require 'weather'

describe Weather do
  it 'has a forecast' do
    weather = Weather.new
    expect(weather).to respond_to :forecast
  end
  it 'returns the weather condition as a symbol' do
    weather = Weather.new
    expect(weather.forecast).to be_a Symbol
  end
  it 'returns the symbol sunny or stormy' do
    weather = Weather.new
    expect(weather.forecast).to eq(:sunny || :stormy)
  end
end

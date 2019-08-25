require 'weather'

describe Weather do

  it 'will be sunny or stormy' do
    weather = Weather.new
    expect(weather.weather_condition).to eq(:sunny).or eq(:stormy)
  end

end

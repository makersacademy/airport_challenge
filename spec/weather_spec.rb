require './lib/weather.rb'

describe Weather do
  it 'checks if sunny or stormy' do
    weather = Weather.new
    expect(weather.weather).to match("sunny").or match("stormy")
    p weather.weather
  end
end

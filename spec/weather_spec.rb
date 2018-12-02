require './lib/weather.rb'

describe Weather do
  it 'reports the weather' do
    weather = Weather.new.get_weather
    expect(weather).to eq("stormy").or eq("clear")
  end
end

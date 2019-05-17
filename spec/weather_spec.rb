require_relative '../docs/weather.rb'

describe Weather do
  it '.initialize sets up array of weather outcomes' do
    weather = Weather.new
    expect(weather.weather_generator).to eq(["sunny", "sunny", "sunny", "sunny", "stormy"])
  end
end

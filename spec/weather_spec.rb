require_relative '../docs/weather.rb'

describe Weather do
  it '.initialize sets up array of weather outcomes' do
    weather = Weather.new
    expect(weather.weather_generator).to eq(["sunny", "sunny", "sunny", "sunny", "stormy"])
  end

  it 'responds to .rand_num' do
    weather = Weather.new
    expect(weather).to respond_to(:rand_num)
  end
end

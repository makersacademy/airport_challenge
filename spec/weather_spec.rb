require './lib/weather.rb'

describe Weather do

  it 'shows if sunny' do
    weather = Weather.new
    allow(weather.weather).to receive("sunny")
  end

  it 'shows if stormy' do
    weather = Weather.new
    allow(weather.weather).to receive("stormy")
  end

end

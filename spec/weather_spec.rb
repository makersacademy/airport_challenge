require './docs/airport_challenge'
require './docs/weather'
require './docs/plane'

describe Weather do
  it 'creates instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end

  it 'weather responds to stormy?' do
    weather = Weather.new
    expect(weather).to respond_to(:stormy?)
  end
  
  it 'is unable to takeoff if weather is stormy' do
    weather = Weather.new
    airport = Airport.new(10)
    weather.stormy?
    expect(airport.takeoff(@plane)).to raise_error 'cannot take off, weather is stormy'
    #how to raise error if stormy? is true???
  end
end

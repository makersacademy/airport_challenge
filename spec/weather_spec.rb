require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Weather do
  weather_with_storm = Weather.new(100)
  capacity = Airport::DEFAULT_CAPACITY

  it 'prevents takeoff if stormy' do
    airport = Airport.new(capacity, weather_with_storm)
    plane = Plane.new
    airport.planes << plane
    expect{ plane.leave_airport(airport) }.to raise_error("Weather is stormy")
  end
end

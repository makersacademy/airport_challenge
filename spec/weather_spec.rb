require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Weather do
  weather_with_storm = Weather.new(100)
  airport = Airport.new(weather_with_storm)
  plane = Plane.new
  airport.planes << plane

  it 'prevents takeoff if stormy' do
    expect { plane.leave_airport(airport) }.to raise_error("Weather is stormy")
  end

  it 'prevents landing if stormy' do
    expect { plane.land_at_airport(airport) }.to raise_error("Weather is stormy")
  end
end

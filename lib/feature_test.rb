require './lib/plane'
plane = Plane.new
plane.landed?

require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off


require './lib/weather'
def forecast
weather = []
weather_select = Random.new
weather_select = weather_select.rand(2)
if weather_select == 0
  weather << 'stormy'
else
  weather << 'sunny'
end
end

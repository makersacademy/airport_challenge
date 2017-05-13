require './lib/airport'
require './lib/plane'
require './lib/weather'

p airport = Airport.new
p plane = Plane.new
p airport.weather
p airport.weather.is_stormy

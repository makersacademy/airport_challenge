require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
weather = Weather.new
p weather.stormy?
#=> true
p airport.land(plane)
#=> fail 
p airport.plane
p weather.stormy?
p weather
#=> true
p airport.take_off(plane)
#=> fail
p airport.plane

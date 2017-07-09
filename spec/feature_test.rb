require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
#default capacity
20.times { airport.land(Plane.new) }
airport.land(Plane.new)



# prevent landing when full
#p airport.land(plane)
#p airport.land(plane)
# => error airport is full

# Stormy weather feature test

weather = Weather.new
#p weather.stormy?
#=> true
#p airport.land(plane)
#=> fail
#p airport.plane


#p weather.stormy?
#p weather
#=> true
#p airport.take_off(plane)
#=> fail
#p airport.plane

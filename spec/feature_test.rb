require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
#default capacity
#100.times { airport.land(Plane.new) }
p airport.land(plane1)
p airport.land(plane2)
p airport.take_off(plane1)
p airport.land(plane3)



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

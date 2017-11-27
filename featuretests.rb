require "./lib/airport"
require "./lib/plane"
require "./lib/weather"
# "allows a plane to land"

airport = Airport.new
plane = Plane.new
weather = Weather.new
airport.land(plane, weather)
p airport.planes_landed

# allows a plane to take off and then removes it from the airport

airport.take_off(plane, weather)
p airport.planes_landed

# prevents takeoff when weather is stormy

# airport.land(plane, weather)
# weather.stormy = true
# airport.take_off(plane, weather)
# p airport.planes_landed

# prevents landing when weather is stormy

# weather.stormy = false
# airport.take_off(plane, weather)
# weather.stormy = true
# airport.land(plane, weather)
# p airport.planes_landed

# prevent planes from landing when the airport is full

# airport1 = Airport.new
# Airport::DEFAULT_CAPACITY.times {airport1.land(Plane.new, weather)}
# airport1.land(plane, weather)
# p airport1.planes_landed.count

# allows a default airport capacity that can be overridden as appropriate
# airport1 = Airport.new(30)
# 30.times {airport1.land(Plane.new, weather)}
# airport1.land(plane, weather)
# p airport1.planes_landed.count

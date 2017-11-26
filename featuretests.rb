require "./lib/airport"
require "./lib/plane"
require "./lib/weather"
# "allows a plane to land"

airport = Airport.new
plane = Plane.new
weather = Weather.new
airport.land(plane)
p airport.planes_landed

# allows a plane to take off and then removes it from the airport

airport.take_off(plane, weather)
p airport.planes_landed

# prevents takeoff when weather is stormy

airport.land(plane)
weather.stormy = true
airport.take_off(plane, weather)
p airport.planes_landed

require './lib/airport'

airport = Airport.new
plane = Plane.new
weather = Weather.new

p weather.storms?
p airport

airport.request_landing(plane, weather)
p airport

require './lib/airport'

airport = Airport.new 20
plane = Plane.new
weather = Weather.new

weather.storms?
p weather
p plane.check?

airport.request_landing(plane, weather)
p airport
p plane.check?

airport.request_takeoff(plane, weather)
p airport
p plane.check?

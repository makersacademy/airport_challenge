require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

airport = Airport.new
plane = Plane.new("Boeing747")
weather = Weather.new
plane_2 = Plane.new("Learjet")

airport.capacity = 5
p airport.land(plane)
p airport.land(plane)
p airport.land(plane)
p airport.land(plane)
p airport.land(plane)
p airport.land(plane)

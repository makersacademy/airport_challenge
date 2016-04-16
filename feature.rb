require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

airport = Airport.new
plane = Plane.new
weather = Weather.new

p airport.land(plane)
p 

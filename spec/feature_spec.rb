require './lib/airport.rb'
require './lib/plane.rb'

p plane = Planes.new
p airport = Airport.new
p airport.let_landing(plane)
p airport.plane

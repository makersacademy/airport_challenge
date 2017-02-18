require './lib/airport.rb'
require './lib/plane.rb'


airport = Airport.new

 airplane = Plane.new

p airport.land(airplane)

p airport.take_off

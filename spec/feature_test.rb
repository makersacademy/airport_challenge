require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
p 1
p plane = Plane.new
p 2
p airport = Airport.new
p 3
p plane.land(airport)
p 4
p plane.landed?
p 5
p airport.hangar
p 6
p airport.take_off(plane)
p 7
p plane.landed?
p 8 
p airport.hangar
p 9 

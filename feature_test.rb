require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane1 = Plane.new
p plane1
p plane1.land(airport)
p plane1.land(airport)

p airport.planes

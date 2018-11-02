require_relative './../lib/plane.rb'
require_relative './../lib/airport.rb'
p "Creates new Airport"
airport1 = Airport.new
p "Creates new plane"
plane1 = Plane.new
p "Lands plane at airport"
plane1.land(airport1)
p "Shows plane in airport hangar"
p airport1.hangar

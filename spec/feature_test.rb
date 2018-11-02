require_relative './../lib/plane.rb'
require_relative './../lib/airport.rb'
p "Creates new Airport"
p airport1 = Airport.new
p "Creates new plane"
p plane1 = Plane.new
p "Lands plane at airport"
p plane1.land(airport1)
p "Shows plane in airport hangar"
p airport1.hangar
p "Makes the plane take off from the airport"
p airport1.takeoff(plane1)
p "Shows the plane has been removed from the hangar"
p airport1.hangar

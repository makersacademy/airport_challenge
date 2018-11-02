require './lib/plane'
require './lib/airport'

p "Creates new Airport"
p airport1 = Airport.new
p "Creates new plane"
p plane1 = Plane.new
p "Changes weather to sunny"
p airport1.weather.what_is_weather = 'sunny'
p "Lands plane at airport"
p plane1.land(airport1)
p "Shows plane in airport hangar"
p airport1.hangar
p "Makes the plane take off from the airport"
p plane1.takeoff
p "Shows the plane has been removed from the hangar"
p airport1.hangar

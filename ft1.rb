require "./lib/airport"
require "./lib/weather"

# takeoff a plane and land it back, check number aiport inventory
weather1 = Weather.new
p luton = Airport.new(weather1)
p ba737 = Plane.new("ba737")
p luton.land(ba737)
p luton.takeoff("ba737")
p ba737.status
p luton.planes
p luton.land(ba737)
p ba737.status
p luton.planes

# takeoff multiple planes and land it back, check number aiport inventory

p ej747 = Plane.new("ej747")
p luton.land(ej747)
p luton.takeoff("ej747")
p "plane: #{luton.land(ej747)}"
p "planes in airport: #{luton.planes}"

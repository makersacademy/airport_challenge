require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/safety'
require_relative '../lib/weather'

p plane1 = Plane.new("Air Force One")
p plane2 = Plane.new("Delta Dawn")
p plane3 = Plane.new("American Airlines Alpha")
p plane4 = Plane.new("Silicone Alley")
p plane5 = Plane.new("Geronimo")
p plane6 = Plane.new("Murphy's Law")
p airport1 = Airport.new("JFK Airport")
p airport2 = Airport.new("LaGuardia Airport")

p plane1.land(airport1)
p plane1.land(airport1)

p plane2.land(airport2)
p plane2.take_off(airport2)
p plane2.take_off(airport2)
p plane2.land(airport1)

p plane3.take_off(airport1)
p plane3.land(airport1)

p plane4.land(airport1)
p plane4.land(airport1)

p plane5.land(airport1)
p plane5.land(airport1)

p plane1.land(airport1)
p plane2.land(airport1)
p plane3.land(airport1)
p plane4.land(airport1)
p plane5.land(airport1)

p plane6.land(airport1)
p plane6.land(airport1)

p plane6.land(airport2)

p plane1.take_off(airport1)
p plane4.take_off(airport1)
p plane5.take_off(airport1)

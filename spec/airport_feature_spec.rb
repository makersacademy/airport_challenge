require 'airport'
require 'plane'

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

Heathrow = Airport.new("Heathrow", 50)
Gatwick = Airport.new("Gatwick", 40)

Heathrow.land(plane1)
Heathrow.land(plane2)
Heathrow.take_off(plane1)
Gatwick.land(plane3)
Gatwick.land(plane1)
Heathrow.take_off(plane2)
Gatwick.take_off(plane3)

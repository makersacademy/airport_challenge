require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

heathrow = Airport.new
gatwick = Airport.new

heathrow.capacity = 3

plane1.land(heathrow)
#p heathrow.planes
plane2.land(heathrow)

#
plane3.land(heathrow)
plane3.land(heathrow)
#
# plane1.takeoff(heathrow)
# plane1.land(gatwick)

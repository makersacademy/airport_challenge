require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane = Plane.new
heathrow = Airport.new
p plane.land(heathrow)
#plane.takeoff(heathrow)

#p heathrow.planes
#plane.land(heathrow)
#p heathrow.planes
#p plane.takeoff(heathrow)
p heathrow.planes
p plane

p heathrow.planes.length
p heathrow.full?
p plane.land(heathrow)

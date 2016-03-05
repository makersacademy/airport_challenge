require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane = Plane.new
plane2 = Plane.new
heathrow = Airport.new
gatwick = Airport.new
heathrow.capacity = 2
plane.land(heathrow)
p plane, plane2
#p heathrow.planes
#plane.land(heathrow)
#p heathrow.planes
#p plane.takeoff(heathrow)
p heathrow.planes
p plane2
p "attempting to land second plane..."
p plane2.land(heathrow)
p heathrow.planes
p gatwick
plane.takeoff(gatwick)
p plane
p heathrow
p gatwick.planes.include?(plane)

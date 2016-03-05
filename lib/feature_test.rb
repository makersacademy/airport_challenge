require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane = Plane.new
heathrow = Airport.new
#plane.land(heathrow)
plane.takeoff
p plane
p
heathrow.request_land(plane)
p heathrow.planes

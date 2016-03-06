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
p plane2.land(heathrow)
p heathrow.planes
p plane.takeoff(heathrow)
p plane
p plane.land(heathrow)
p ObjectSpace.each_object(Weather).count
p plane.weather

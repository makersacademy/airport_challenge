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
plane2.land(heathrow)
p heathrow.planes
plane.takeoff(heathrow)
p plane
plane.land(heathrow)
p plane
plane.takeoff(heathrow)
plane.land(gatwick)
puts "Gatwick:{#{gatwick.planes}}"
puts "Heathrow:{#{heathrow.planes}}"

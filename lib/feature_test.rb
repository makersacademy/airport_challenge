require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

heathrow = Airport.new
gatwick = Airport.new

heathrow.capacity = 10

plane1.land(heathrow)
plane2.land(heathrow)

plane3.land(gatwick)

plane1.takeoff(heathrow)
plane1.land(gatwick)

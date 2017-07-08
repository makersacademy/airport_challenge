# require './lib/plane'
# require './lib/airport'
#
# plane1 = Plane.new
# plane2 = Plane.new
# plane3 = Plane.new
#
# southend = Airport.new
# gatwick = Airport.new(50)
# caen = Airport.new(2)
#
# southend.land(plane1)
# southend.land(plane2)
# southend.land(plane3)
#
# southend.take_off(plane1)
# southend.take_off(plane2)
# southend.take_off(plane3)
#
# southend.land(plane1)
# gatwick.land(plane2)
# caen.land(plane3)
#
# southend.take_off(plane1)
# gatwick.take_off(plane2)
# caen.take_off(plane3)
#
# 50.times { gatwick.land(Plane.new) }

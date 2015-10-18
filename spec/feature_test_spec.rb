require 'airport'

lhr = Airport.new('Heathrow', 5)
jfk = Airport.new('JFK')
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new

lhr.move_to_hangar(plane1)
lhr.move_to_hangar(plane2)
lhr.move_to_hangar(plane3)
jfk.move_to_hangar(plane4)
jfk.move_to_hangar(plane5)

lhr.take_off(plane1)
jfk.land(plane1)

lhr.take_off(plane3)
jfk.land(plane3)
jfk.take_off(plane3)
lhr.land(plane3)

jfk.take_off(plane4)

jfk.take_off(plane5)
lhr.land(plane5)

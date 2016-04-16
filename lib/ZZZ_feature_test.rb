# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport and confirm that has landed

a1 = Airport.new(Plane)
a2 = Airport.new(Plane)

p1 = a1.planes.first
p1.take_off(a1)

p a1.planes
p p1.status






require_relative 'plane'

london = Airport.new
paris = Airport.new
madrid = Airport.new

p1 = Plane.new
p2 = Plane.new
p3 = Plane.new
p4 = Plane.new
p5 = Plane.new
p6 = Plane.new
p7 = Plane.new
p8 = Plane.new
p9 = Plane.new

london.storage.concat([p1, p2, p3])
paris.storage.concat([p4, p5, p6])
madrid.storage.concat([p7, p8, p9])

# p london.storage
# p paris.storage
# p madrid.storage

# p london.all_planes

puts
puts "Showing that p1 is at london airport:"
puts london.plane_location(p1)
p1.take_off(london)
puts "Showing that p1 is no longer at london airport:"
p london.storage
puts
puts "Showing that it will now be in the air:"
puts p1.plane_status
puts london.plane_location(p1)
p1.land(madrid)
puts "Showing that the plane is now at madrid airport"
p madrid.storage
puts london.plane_location(p1)
puts
#puts "Checking that the plane"


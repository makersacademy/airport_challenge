require_relative 'airport'

ap = Airport.new

p1, p2, p3, p4 = [Plane.new, Plane.new, Plane.new, Plane.new]
ap.land([p1, p2, p3, p4])

# New planes initiate with information about themselves, including flight
# number & country of origin:
puts
puts 'Single plane: '
p p1
puts 
p [p1.flight_no, p1.origin]
puts

puts 'Planes grounded in airport:'

p ap.parked_planes.map { |p| "#{p.flight_no}, #{p.origin}" }
puts

p1.set_destination
puts 'After changing the destination of p1, at this airport'
puts '(Same obj, different destination & origin):'
p p1
puts

puts 'Planes now currently parked:'
p ap.parked_planes.map { |p| "#{p.flight_no}, #{p.destination}" }
puts

ap.take_off([p1])
puts 'And after the first has taken off:'
p ap.parked_planes.map { |p| "#{p.flight_no}, #{p.destination}" }
puts

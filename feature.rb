require './lib/airport.rb'
my_airport = Airport.new
puts my_airport
puts my_airport.object_id

plane1 = Plane.new
puts plane1

puts "can the plane land: #{my_airport.land(plane1)}"
puts my_airport.object_id
puts plane1.airport
puts "can the plane takoff: #{my_airport.takeoff(plane1)}"

puts "can we change the airport to full: #{my_airport.full?}"

# puts "when the airport is full, can the plane land: #{my_airport.land(plane1)}"

puts "which airport did the plane land at? #{plane1.airport}"

puts my_airport1 = Airport.new(45)
puts my_airport1.capacity

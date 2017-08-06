require './lib/airport.rb'

puts "1. I can create an Airport"
airport = Airport.new
puts airport

puts "2. I can create a Plane"
plane = Plane.new
puts plane

puts "3. I can create a weather Class"
weather = Weather.new
puts weather

puts "4. I can instruct a plane to land"
p "airport.land(plane): #{airport.land(plane)}"
p "airport.onground: #{airport.onground}"

puts "5. A plane can take off and confirm it is not at the airport"
p "airport.take_off(plane): #{airport.take_off}"
p "airport.onground: #{airport.onground}"
p "airport.inair: #{airport.inair}"

=begin

raised execptions:

puts "6. A plane will not land if it is stormy"
p "airport.land(plane, true): #{airport.land(plane, true)}"

puts "7. A plane will not take off if stormy"
p "airport.take_off(plane, true): #{airport.take_off(true)}"

puts "8. A plane will not land if the airport is full"
p "21.times { airport.land(Plane.new):" 21.times { airport.land(Plane.new) }
p airport.onground

=end

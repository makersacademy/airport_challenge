require_relative '../lib/airplane.rb'
require_relative '../lib/airport.rb'

puts "CREATING AIRPLANE:"
first_airplane = Airplane.new
puts "status: " + first_airplane.status
puts " "

puts "CREATING AIRPORT:"
my_airport = Airport.new("Schipol")
puts my_airport.airport_name
puts " "

puts "LANDING AIRPLANE:"
first_airplane.land_plane(my_airport)
puts "status: " + first_airplane.status
puts " "

puts "TAKING OFF AIRPLANE:"
first_airplane.take_off(my_airport)
puts "status: " + first_airplane.status

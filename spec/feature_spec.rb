require 'airport'
require 'plane'

# A feature test file to test user stories and edge cases

puts "Creating an airport called miami with a capacity of 5 and a storm probability of 50%."
miami_airport = Airport.new(5,50)
puts "Creating an airport called boston with a capacity of 5 and a storm probability of 0%."
boston_airport = Airport.new(5, 0)
puts "Creating five new planes."
plane_one = Plane.new
plane_two = Plane.new
plane_three = Plane.new
plane_four = Plane.new
plane_five = Plane.new
plane_six = Plane.new

puts "Requesting permission to land plane one at Boston Airport."
boston_airport.land_plane(plane_one)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

puts "Requesting permission to land plane two at Boston Airport."
boston_airport.land_plane(plane_two)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

puts "Requesting permission to land plane three at Boston Airport."
boston_airport.land_plane(plane_three)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

puts "Requesting permission to take-off plane one at Boston Airport."
boston_airport.permit_takeoff(plane_one)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

puts "Requesting permission to take-off plane two at Boston Airport."
boston_airport.permit_takeoff(plane_two)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

puts "Requesting permission to take-off plane three at Boston Airport."
boston_airport.permit_takeoff(plane_three)

puts "There are #{miami_airport.planes.length} on the ground at Miami airport."
puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

# This block will not allow a plane to land as it is already landed.
#puts "Requesting permission to land plane one at Miami Airport."
#miami_airport.land_plane(plane_one)
#puts "There are #{miami_airport.planes.length} on the ground at Miami airport."

# This block tries to take-off a plane from the wrong airport
#puts "Requesting permission to take-off plane one at Miami Airport."
#miami_airport.permit_takeoff(plane_one)
#puts "There are #{miami_airport.planes.length} on the ground at Miami airport."

# Checks a plane can have and not have an airport
#puts "Does plane one have an airport set:  #{!plane_one.airport.nil?}"
#puts "Requesting permission to take-off plane one at Boston Airport."
#boston_airport.permit_takeoff(plane_one)
#puts "There are #{boston_airport.planes.length} on the ground at Boston airport."
#puts "Does plane one have an airport set:  #{!plane_one.airport.nil?}"

# This block tries to take-off a plane that is already in the air.
#puts "Requesting permission to take-off plane one at Boston Airport."
#boston_airport.permit_takeoff(plane_one)
#puts "There are #{boston_airport.planes.length} on the ground at Boston airport."

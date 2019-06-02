require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
require_relative '../lib/airport.rb'

# def test_take_off
#   airport = Airport.new
#   plane = Plane.new
#   puts "Plane at airport? #{plane.at_airport?}"
#   airport.set_safety
#   puts "Is the airport full? #{airport.full?}"
#   puts "Is it sunny at the airport #{airport.sunny?}"
#   puts "Airport safe: #{airport.safe?}"
#   puts "Plane asked to take-off"
#   puts "Airport safe: #{airport.safe?}"
#   puts "Plane asked to take-off"
#   plane.take_off(airport)
#   puts "Plane at airport? #{plane.at_airport?}"
# end

# def test_landing
#   airport = Airport.new
#   plane = Plane.new
#   puts "Plane at airport? #{plane.at_airport?}"
#   airport.set_safety
#   puts "Is the airport full? #{airport.full?}"
#   puts "Is it sunny at the airport #{airport.sunny?}"
#   puts "Airport safe: #{airport.safe?}"
#   puts "Plane asked to take-off"
#   plane.take_off(airport)
#   puts "Plane at airport? #{plane.at_airport?}"
#   airport.set_safety
#   puts "Is the airport full? #{airport.full?}"
#   puts "Is it sunny at the airport #{airport.sunny?}"
#   puts "Airport safe: #{airport.safe?}"
#   puts "Plane asked to take-off"
#   puts "Airport safe: #{airport.safe?}"
#   puts "Plane asked to land"
#   plane.land(airport)
#   puts "Plane at airport? #{plane.at_airport?}"
# end

# puts "---------Test 1---------"
# test_take_off
# puts "---------Test 2---------"
# test_landing

   airport = Airport.new
   plane = Plane.new
   airport.land(plane)
   p airport.hanger
   airport.take_off(plane)
   p airport.hanger



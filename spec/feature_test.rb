require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
require_relative '../lib/airport.rb'

airport = Airport.new
plane = Plane.new
puts "Plane at airport? #{plane.at_airport?}"
airport.set_safety
puts "Airport safe: #{airport.safe?}"
puts "Plane asked to take-off"
plane.take_off(airport)
puts "Plane at airport? #{plane.at_airport?}"
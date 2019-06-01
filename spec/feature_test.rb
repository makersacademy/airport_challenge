require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
require_relative '../lib/airport.rb'

airport = Airport.new
plane = Plane.new
#weather = Weather.new
puts "Plane at airport? #{plane.at_airport?}"
#puts "Weather at airport: #{weather.generate_weather}"
puts "Airport safe: #{airport.safe?}"
puts "Plane asked to take-off"
plane.take_off
puts "Plane at airport? #{plane.at_airport?}"
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

plane = Plane.new
puts "Plane at airport? #{plane.at_airport?}"
puts "Plane asked to take-off"
plane.take_off
puts "Plane at airport? #{plane.at_airport?}"
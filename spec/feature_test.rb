require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

p "Does weather.report return stormy or good?"
Weather.new.report


puts "feature test starting"
plane = Plane.new
airport = Airport.new
plane.land(airport)

p airport.landed_planes
puts "hello"
puts airport.capacity
airport.say_hey


puts "should be able to land a plane"

plane.land(airport)

puts "plane should be able to fly"

plane.fly

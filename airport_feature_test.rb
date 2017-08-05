require './lib/plane.rb'
require './lib/airport.rb'
puts "landing test"
plane = Plane.new(nil, "in the air")
puts plane.land
puts "takeoff test"
airport = Airport.new
plane = Plane.new(airport)
plane.take_off
puts plane.status
puts "takeoff when stormy test"
airport = Airport.new("stormy")
plane = Plane.new(airport)
puts plane.take_off

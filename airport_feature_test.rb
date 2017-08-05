require './lib/plane.rb'
require './lib/airport.rb'

puts "landing test"
airport = Airport.new
plane = Plane.new(airport, "in the air")
puts plane.land

puts "takeoff test"
airport = Airport.new
plane = Plane.new(airport, "on the ground")
plane.take_off
puts plane.status

puts "takeoff when stormy test"
airport = Airport.new("stormy")
plane = Plane.new(airport, "on the ground")
puts plane.take_off

puts "unable to land when stormy"
airport = Airport.new("stormy")
plane = Plane.new(airport, "in the air")
puts plane.land

puts "unable to land when airport is full"
airport = Airport.new("sunny",true)
plane = Plane.new(airport, "in the air")
puts plane.land

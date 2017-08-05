require './lib/plane.rb'
require './lib/airport.rb'

puts "landing test"
airport = Airport.new
plane = Plane.new(airport, "in the air")
puts plane.land

puts "takeoff test"
irport = Airport.new
plane = Plane.new(airport, "on the ground")
plane.take_off
puts plane.status

puts "takeoff when stormy test"
irport = Airport.new
plane = Plane.new(airport, "on the ground")
puts plane.take_off

puts "unable to land when stormy"
irport = Airport.new
plane = Plane.new(airport, "in the air")
puts plane.land

puts "unable to land when airport is full"
irport = Airport.new
plane = Plane.new(airport, "in the air")
puts plane.land

puts "default airport capacity applied"
airport = Airport.new
puts airport.capacity

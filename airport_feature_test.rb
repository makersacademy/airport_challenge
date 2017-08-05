require './lib/plane.rb'
puts "landing test"
plane = Plane.new
plane.land
puts "takeoff test"
plane = Plane.new
plane.take_off
plane.status

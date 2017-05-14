require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
airport.capacity = 14
puts airport.capacity

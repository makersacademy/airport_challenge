require './lib/airport.rb'

airport = Airport.new 7
plane = Plane.new
airport.full?
airport.stormy?
airport.land(plane)
airport.take_off(plane)

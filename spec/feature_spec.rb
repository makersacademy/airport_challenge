require './lib/plane.rb'
require './lib/airport.rb'

plane = Plane.new
airport = Airport.new

airport.land(plane)
airport.take_off(plane)

airport.new_capacity(1)

airport.land(plane)

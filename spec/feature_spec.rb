require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new

airport.land(plane)
airport.takeoff(plane)
@weather = "stormy"
airport.land(plane)
airport.takeoff(plane)

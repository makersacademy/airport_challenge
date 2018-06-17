require_relative '../lib/airport.rb'

airport = Airport.new(20)
plane = Plane.new
airport.land(plane)
puts plane.at_airport?
airport.takeoff(plane)
puts plane.at_airport?
20.times { airport.land(Plane.new) }
airport.land(plane)

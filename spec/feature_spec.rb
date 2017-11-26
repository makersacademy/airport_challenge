require "plane"
require "airport"
require "weather"
a_plane = Plane.new
a_airport = Airport.new
a_airport.land(a_plane)
a_airport.take_off(a_plane)
15.times{ a_airport.land(Plane.new) }
10.times{ a_airport.take_off(plane) }
a_airport.capacity = 10
5.times{ a_aiport.land(Plane.new) }
a_airport.full?

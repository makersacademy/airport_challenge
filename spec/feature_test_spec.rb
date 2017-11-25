 require "airport"
 require "plane"

 # feature 1- ability to land a plane at an airport
p my_airport = Airport.new
p my_plane = Plane.new
p my_airport.land my_plane

 # feature 2- ability to check which planes are currently in an airport
p my_airport.planes 
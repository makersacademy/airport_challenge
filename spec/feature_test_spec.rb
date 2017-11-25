 require "airport"
 require "plane"

 # feature 1- ability to land a plane at an airport
p "creating airport"
p my_airport = Airport.new
p "creating plane"
p my_plane = Plane.new
p "land plane at airport"
p my_airport.land my_plane

 # feature 2- ability to check which planes are currently in an airport
p "list planes at airport"
p my_airport.planes

 # feature 3 -planes take off from airport
p "release plane from airport"
p my_airport.release my_plane

 #feature 4 -planes keep track of where they are
p "get location of plane"
p my_plane.location 
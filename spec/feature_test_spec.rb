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
p my_airport.release_for_takeoff my_plane

 # feature 4 -planes keep track of where they are
p "get location of plane"
p my_plane.location 

 # for robustness planes can also be landed using the plane.land airport syntax without error
p "my_plane.land my_airport"
p my_plane.land my_airport
p "my_airport.planes"
p my_airport.planes

 #likewise, planes can also be told to take off and will co-ordinate this with the airport
p "my_plane.take_off"
p my_plane.take_off
p "my_airport.planes"
p my_airport.planes

 # feature 5 -airports should be able to check whether it's safe to takeoff and land
p "my_airport.safe_to_fly?" 
p "(This method has been made private)"


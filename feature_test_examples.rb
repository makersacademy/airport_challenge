 require_relative "lib/airport.rb"

 p "feature 1- ability to land a plane at an airport"
 p "creating airport: my_airport = Airport.new"
 p my_airport = Airport.new
 p "creating plane"
 p my_plane = Plane.new
 p "land plane at airport: my_plane = Plane.new"
 p my_airport.land my_plane
 p "\n"
 p "feature 2- ability to check which planes are currently in an airport"
 p "list planes at airport: my_airport.planes"
 p my_airport.planes
 p "\n"
 p "feature 3 -planes take off from airport"
 p "release plane from airport: my_airport.release_for_takeoff my_plane"
 p my_airport.release_for_takeoff my_plane
 p "\n"
 p "feature 4 -planes keep track of where they are"
 p "get location of plane: my_plane.location"
 p my_plane.location 
 p "\n"
 p "for robustness planes can also be landed using the plane.land airport syntax without error"
 p "my_plane.land my_airport"
 p my_plane.land my_airport
 p "my_airport.planes"
 p my_airport.planes
 p "\n"
 p "likewise, planes can also be told to take off and will co-ordinate this with the airport"
 p "my_plane.take_off"
 p my_plane.take_off
 p "my_airport.planes"
 p my_airport.planes

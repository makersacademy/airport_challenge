require "./lib/airport.rb"
require "./lib/plane.rb"
airport = Airport.new
plane = airport.depart_plane
plane.flying?
airport.land_plane(plane)
airport.plane

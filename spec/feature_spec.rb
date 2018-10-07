require "./lib/airport.rb"
require "./lib/plane.rb"
require "./lib/weather.rb"
weather = Weather.new
airport = Airport.new
plane = Plane.new
10.times airport.land_plane(plane)
plane = airport.depart_plane
plane.flying?
airport.land_plane(plane)
airport.plane
weather.conditions

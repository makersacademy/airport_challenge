require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'
p plane = Plane.new
p airport = Airport.new
p plane2 = Plane.new
p airport.land(plane)
p airport.land(plane2)
p airport.take_off(plane)
#p plane.land(airport)
#p 4
#p plane.landed?
#p 5
#p plane.land
#p 6
#p plane.landed?
#p airport.planes
#p airport.add_plane(plane)
#p airport.take_off(plane)
#
#p 7
#p plane.landed?
#p 8 
#p airport.hangar
#p 9 
#p weather = Weather.new
#p 10
#p weather.random_num
#p 11
#50.times{p weather.stormy?}
#p 12
12.times {p airport.land(plane)}



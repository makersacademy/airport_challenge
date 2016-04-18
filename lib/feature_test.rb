require './airport.rb'

airport = Airport.new
plane = Plane.new
plane1 = Plane.new
airport2 = Airport.new

p airport.planes
airport.take_off plane
airport.land plane
5.times {airport2.land Plane.new}
airport.land plane 

p "Airport1" + airport.planes.to_s
p "Airport2" + airport2.planes.to_s
p airport2.take_off plane
5.times {airport2.take_off plane}

p "Airport1" + airport.planes.to_s
p "Airport2" + airport2.planes.to_s
p airport.planes


airport.take_off plane

p airport.planes
p airport.current_weather
airport.weather 
p airport.current_weather 


p airport.land plane

airport.take_off plane

airport.land plane

plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new

airport.land plane2

p airport2.take_off plane2 

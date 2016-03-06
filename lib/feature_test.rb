require './airport.rb'

airport = Airport.new
plane = Plane.new
plane1 = Plane.new
airport2 = Airport.new

p airport.planes #p prints array of planes in the airport
airport.take_off plane
airport.land plane
5.times {airport2.land Plane.new}
airport.land plane #should not be able to land same plane twice

#see planes inside the airport after landing
p "Airport1" + airport.planes.to_s
p "Airport2" + airport2.planes.to_s
p airport2.take_off plane
5.times {airport2.take_off plane}

p "Airport1" + airport.planes.to_s
p "Airport2" + airport2.planes.to_s
p airport.planes
#plane takes off 
airport.take_off plane

#no planes at airport
p airport.planes
p airport.current_weather
airport.weather #changes weather
p airport.current_weather #prints the current weather


p airport.land plane

p "Thankfully it's not stormy. I would have missed my next flight"
airport.take_off plane

airport.land plane

plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new

airport.land plane2
#error if plane instruct to take off from another airport
p airport2.take_off plane2 

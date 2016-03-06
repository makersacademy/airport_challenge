require './airport.rb'

airport = Airport.new
plane = Plane.new
plane = Plane.new
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
plane.change_landed_status
p "Airport1" + airport.planes.to_s
p "Airport2" + airport2.planes.to_s
p airport.planes.length
#plane takes off 
airport.take_off plane

#no planes at airport
p airport.planes

airport.weather #changes weather
p airport.current_weather #prints the current weather
airport.weather
p airport.weather
p airport.current_weather
p airport.land plane

p "Thank god its not stormy. I would have missed my appointment"
airport.take_off plane

airport.land plane


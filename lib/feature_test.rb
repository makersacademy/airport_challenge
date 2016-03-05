require './airport.rb'

airport = Airport.new
plane = Plane.new

p airport.planes #p prints array of planes in the airport

airport.land plane
airport.land plane #should not be able to land same plane twice

#see planes inside the airport after landing
p airport.planes

#plane takes off 
airport.take_off plane

#no planes at airport
p airport.planes

airport.weather #changes weather to stormy
p airport.current_weather #prints the current weather

airport.land plane

p ">>>this should not be printed<<< if landing during stormy weather"
airport.take_off plane
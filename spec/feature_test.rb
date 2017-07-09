require './lib/airport.rb'
require './lib/plane.rb'

# ensure planes can't land if they are already landed
# airport = Airport.new
# p plane = Plane.new
# p airport.land(plane)
# p airport.land(plane)
# => fail plane is already on the ground

# ensure planes can't take off if they are not in the airport
# airport = Airport.new
# p plane1 = Plane.new
# p plane2 = Plane.new
# p airport.land(plane1)
# p airport.take_off(plane2)
# => fail plane is flying

# check planes know they have taken off
# airport = Airport.new
# p plane = Plane.new
# p airport.land(plane)
# p plane.flying?
# => false
# p plane.landed?
# => true
# p airport.take_off(plane)
# p plane.flying?
# => true
# p plane
# p plane.landed?
# => false

# check planes know they have landed
# airport = Airport.new
# p plane = Plane.new
# p plane.flying?
# => true
# p airport.land(plane)
# p plane.flying?
# => false
# p plane.landed?
# => true

# check planes know they are flying
# airport = Airport.new
# p plane = Plane.new
# p plane.flying?
# => true
# p airport.land(plane)
# p plane.flying?
# => false

# check capacity can be set when new airport is created
# p airport = Airport.new(50)

# check default capacity = 100
# 100.times { airport.land(Plane.new) }
# p airport.land(Plane.new)

# check can instruct named planes to take off and land
# plane1 = Plane.new
# plane2 = Plane.new
# plane3 = Plane.new
# p airport.land(plane1)
# p airport.land(plane2)
# p airport.take_off(plane1)
# p airport.land(plane3)

# prevent landing when full
# p airport.land(plane)
# p airport.land(plane)
# => error airport is full

# check stormy weather

# p airport = Airport.new
# p weather.stormy?
# => true
# p weather
# p airport.land(plane)
# => fail
# p airport.plane

p airport = Airport.new
p plane = Plane.new
p airport.land(plane)
p airport.weather.stormy?
# p weather.stormy?
# p airport.weather
# => true
p airport.take_off(plane)
# => fail
p airport.plane

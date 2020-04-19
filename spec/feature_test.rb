require './lib/airport'
require './lib/plane'
require './lib/weather'

airport1 = Airport.new(15)
airport2 = Airport.new(10)


# plane1 = Plane.new
# plane2 = Plane.new

# airport.take_off(plane1)
# airport.take_off(plane2)
# airport.land(plane1)

# 10.times { airport.land Plane.new }

p airport1.capacity
p airport2.capacity

p airport1.weather.is_stormy?
p airport2.weather.is_stormy?

airport1.capacity = 20
p airport1.capacity
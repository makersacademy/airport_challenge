require './lib/airport'
require './lib/plane'
require './lib/weather'

airport = Airport.new
airport.is_full?

weather = Weather.new

weather.is_stormy?
# plane1 = Plane.new
# plane2 = Plane.new

# airport.take_off(plane1)
# airport.take_off(plane2)
# airport.land(plane1)

18.times { airport.land Plane.new }

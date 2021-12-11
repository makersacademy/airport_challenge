require './lib/plane.rb'
require './lib/airport.rb'

plane = Plane.new
airport = Airport.new

airport.set_weather(2)

5.times { airport.land(plane) }

5.times { airport.take_off(plane) }

airport.new_capacity(10)

10.times { airport.land(plane) }

10.times { airport.take_off(plane) }

airport.set_weather(1)

airport.land(plane)


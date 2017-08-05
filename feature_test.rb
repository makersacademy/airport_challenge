require './docs/plane.rb'
require './docs/airport.rb'

plane1 = Plane.new
plane1.land
airport = Airport.new
airport.take_off(plane1)

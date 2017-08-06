require './docs/airport.rb'

airport = Airport.new
plane1 = airport.create_planes
h = airport.take_off(plane1)
airport_status = airport.planes

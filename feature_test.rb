require './docs/airport.rb'

airport = Airport.new
airport.create_planes
plane2 = airport.create_planes
airport.take_off(plane2)
airport.landing(plane2)

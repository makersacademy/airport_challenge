require './docs/airport.rb'

airport = Airport.new
plane1 = airport.create_planes
h = airport.planes.take_off(plane1)
airport.take_off(airport.planes[1])
# h is nil class so this doesn't work as it is no longer part of the Airport class
# don't want it to get rid of the airport object
airport.planes = h

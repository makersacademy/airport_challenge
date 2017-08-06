require './docs/airport.rb'

airport = Airport.new
plane1 = airport.create_planes
h = airport.take_off(plane1)
#is this actually working though as now the Airport.new instance which was set 
#has changed names and is h
airport.planes = h

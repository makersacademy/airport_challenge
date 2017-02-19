require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'


forecast = Weather.new.stormy?

#forecast = false

airport = Airport.new(forecast)

#p airport.take_off

p 9.times{p airport.land(Plane.new)}

plane = Plane.new

#p airport.take_off

#p airport.land(plane)

p airport.land(plane)

p airport#.plane_list

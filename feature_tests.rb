require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'


p forecast = Weather.new.stormy?

forecast = false

p airport = Airport.new(forecast)

p airport.take_off

p 10.times{p airport.land(Plane.new)}

plane = Plane.new

p airport.take_off

p airport.land(plane)

p airport.land(plane)

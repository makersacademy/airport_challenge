require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'


p forecast = Weather.new.stormy?

airport = Airport.new(forecast)

airplane = Plane.new

p airport.land(airplane)

p airport.land(airplane)

p airport.take_off

p airport.land(airplane)

#p airport.take_off(forecast)

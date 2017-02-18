require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'


airport = Airport.new

airplane = Plane.new

airport.land(airplane)

p forecast = Weather.new.stormy?

p airport.take_off(forecast)

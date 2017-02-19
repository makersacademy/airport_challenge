require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'


p forecast = Weather.new.stormy?

airport = Airport.new(forecast)

15.times{p airport.land(Plane.new)}

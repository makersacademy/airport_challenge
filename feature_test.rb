require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

airport = Airport.new
plane1 = Plane.new

p plane1.land(airport)
p plane1.take_off(airport)




require './lib/airport.rb'
require './lib/weather.rb'
require './lib/plane'

heathrow = Airport.new
p heathrow.weather.stormy?

p heathrow.hangar["1"]

plane = Plane.new

p plane.land(heathrow)

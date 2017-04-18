require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

heathrow = Airport.new
lax = Airport.new
boeing747 = Plane.new
weather = Weather.new
learjet = Plane.new

heathrow.capacity = 100
p heathrow.capacity

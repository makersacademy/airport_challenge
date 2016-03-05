require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

american_1 = Plane.new
a_port = Airport.new
weather = Weather.new

p weather.storm?

a_port.arrive(american_1, weather)

p a_port.planes


weather.status

a_port.depart(american_1)

p a_port.planes
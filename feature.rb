require_relative './lib/airport.rb'
require_relative './lib/plane.rb'

american_1 = Plane.new
a_port = Airport.new

a_port.arrive(american_1.land)

a_port.planes

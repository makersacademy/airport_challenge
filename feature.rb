require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

american_1 = Plane.new
lufthansa_2 = Plane.new
a_port = Airport.new
b_port = Airport.new
weather = Weather.new

# p a_port.arrive(american_1, weather)

p a_port.arrive(lufthansa_2, weather)

p b_port.arrive(lufthansa_2, weather)



# p a_port.depart(american_1, weather)

# p a_port.planes
require './lib/airport.rb'
require './lib/aeroplane.rb'
require './lib/weather.rb'

airport1 = Airport.new
airport2 = Airport.new
boeing = Aeroplane.new
weather = Weather.new
jet = Aeroplane.new

airport1.max_capacity = 100
p airport1.max_capacity

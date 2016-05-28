require_relative '../lib/airport.rb'
require_relative '../lib/passenger.rb'

person = Passenger.new
airport = Airport.new

p airport.load(person)
p airport.unload(person)
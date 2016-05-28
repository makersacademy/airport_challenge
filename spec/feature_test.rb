require_relative '../lib/airport.rb'
require_relative '../lib/passenger.rb'

people = [Passenger.new,Passenger.new,Passenger.new]
airport = Airport.new

p airport.passengers

p airport.load(people)
p airport.load

 airport.unload
p airport.passengers
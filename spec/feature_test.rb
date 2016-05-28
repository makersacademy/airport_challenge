require_relative '../lib/airport.rb'
require_relative '../lib/passenger.rb'

people = [Passenger.new,Passenger.new,Passenger.new]
airport = Airport.new

p airport.passengers
p airport.load(people)
p airport.load
p airport.unload
p airport.passengers
p airport.load(people)
p airport.passengers

p airport.unload
p airport.passengers

p airport.load([*1..100])
p airport.passengers.size



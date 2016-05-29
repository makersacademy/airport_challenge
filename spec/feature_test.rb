require_relative '../lib/airport.rb'
require_relative '../lib/passenger.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

people = [Passenger.new,Passenger.new,Passenger.new]
people2 = [Passenger.new,Passenger.new,Passenger.new]
airport = Airport.new
airport2 = Airport.new
plane = Plane.new(airport)
plane2 = Plane.new(airport)

airport.load(people)
airport.seats
plane.load(airport.unload)
plane.seats
plane.take_off(airport)
plane.land(airport2)
airport2.load(plane.unload)
plane.seats
airport.seats
airport2.seats







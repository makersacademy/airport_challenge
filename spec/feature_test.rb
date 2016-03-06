require_relative '../lib/airport'

airport = Airport.new(2)
puts airport
plane1 = Plane.new
puts plane1
plane2 = Plane.new
puts plane2
puts 'airport.land plane1'
airport.land plane1
puts 'airport.land plane2'
airport.land plane2
puts 'airport.take_off plane1'
airport.take_off plane1
puts 'airport.take_off plane2'
airport.take_off plane2

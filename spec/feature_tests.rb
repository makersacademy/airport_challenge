require_relative '../docs/airport.rb'

airport = Airport.new
plane = Plane.new
airport.land(plane)

puts airport.weather.not_safe?

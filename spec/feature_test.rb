require_relative '../lib/plane.rb'

airport = Airport.new(Weather.new)
plane = Plane.new
plane.land(airport)
puts plane.at_airport?
plane.takeoff
puts plane.at_airport?

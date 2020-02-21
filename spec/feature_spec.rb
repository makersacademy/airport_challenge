require_relative '../lib/airport'

airport = Airport.new
plane = Plane.new

#test to see if the weather generator works for taking off
# airport.land(plane)
# 50.times{puts airport.take_off}

#test to see if the weather generator works for landing
# 50.times{puts airport.land(plane)}
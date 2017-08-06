require './docs/airport.rb'

# Fixed the feature test so when the plane takes off it no longer
# deleted the airport object as well as itself!
# previous the new object of airport 'h' deleted the airport instance itself.
airport = Airport.new
plane1 = Plane.new
airport.take_off(plane1)
# when you then enter 'airport' after that you are left with the
# airport object and an empty array of planes.

require './docs/airport.rb'

airport = Airport.new
plane1 = Plane.new
airport.take_off(plane1)
# when you then enter 'airport' after that you are left with the
# airport object and an empty array of planes.
airport.landing(plane1)
# airport then gives @planes = [] so code can be changed to fix this.

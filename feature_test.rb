require './docs/airport.rb'

#feature test for landing
airport = Airport.new
plane1 = Plane.new
airport.planes # equals nil at the moment
airport.create_planes
airport.planes # has only the second plane, not plane1 in it
airport.landing(plane1)
airport.planes # now includes plane1

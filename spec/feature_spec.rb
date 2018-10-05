require './lib/airport.rb'
require './lib/plane.rb'

@airport = Airport.new
@plane = Plane.new
@airport.instruct(@plane)
@plane.takeoff(@plane)
@plane.status
@plane.land(@plane)
@plane.status

require "airport"
require "plane"

planes = Array.new(5) { Plane.new }
gatwick = Airport.new
gatwick.land(planes[0])
gatwick.takeoff(planes[0])

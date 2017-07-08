require "airport"
require "plane"

gatwick = Airport.new(50)
boeing = Plane.new
gatwick.land(boeing)
gatwick.takeoff(boeing)
gatwick.plane

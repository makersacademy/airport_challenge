require "airport"
require "plane"

gatwick = Airport.new
boeing = Plane.new
gatwick.land(boeing)
gatwick.takeoff(boeing)
boeing.flying

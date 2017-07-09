require "airport"
require "plane"

gatwick = Airport.new
boeing = Plane.new
gatwick.land(boeing)
boeing.flying
gatwick.takeoff(boeing)
boeing.flying

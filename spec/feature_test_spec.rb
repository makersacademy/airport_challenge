require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.takeoff(plane)
  airport.planes == []
end

require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

def land(plane)
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
end

require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

def land(plane)
  airport = Airport.new
  airport.land(plane)
end

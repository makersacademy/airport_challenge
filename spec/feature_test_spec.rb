require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

def its_stormy
  weather = Weather.new
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.take_off(plane, weather)
end

def stormy_landing
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, Weather.new(36))
end

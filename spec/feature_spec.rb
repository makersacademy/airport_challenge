require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

def land(plane)
  airport = Airport.new
  airport.land(plane)
end

def take_off(plane)
  airport = Airport.new
  airport.take_off(plane)
  plane.status
end

def refuse_take_off
  stormy
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
  airport.take_off(plane)
end

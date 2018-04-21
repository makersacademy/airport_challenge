require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

def land_a_plane_at_the_airport
  plane = Plane.new
  airport = Airport.new
  aiport.land(plane)
end

def take_off_plane
  plane = Plane.new
  airport = Airport.new
  airport.takeoff(plane)
end

def show_plane_status
  plane = Plane.new
  plane.status
end

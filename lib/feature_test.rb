require_relative 'airport'
require_relative 'plane'

airport = Airport.new
plane = Plane.new
plane_2 = Plane.new

airport.land(plane)
airport.land(plane_2)

puts airport.hangar
puts airport.object_id
puts airport.get_airport_id
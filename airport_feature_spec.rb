require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.land(plane)
puts airport.hangar
airport.take_off(plane)
puts { airport.hangar }
end

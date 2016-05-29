require './lib/airport.rb'
airport = Airport.new
21.times do
  plane = Plane.new
  airport.land(plane)
end


require "airport"
require "plane"

planes = Array.new(5) { Plane.new }
gatwick = Airport.new
planes.each do |plane|
  gatwick.land(plane)
  gatwick.takeoff(plane)
end

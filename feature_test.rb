require_relative './lib/airport'
puts
p "airport = #{airport = Airport.new}"
puts
p "plane1 = #{plane1 = Plane.new}"
puts
p "plane2 = #{plane2 = Plane.new}"
puts
p "plane3 = #{plane3 = Plane.new}"
puts
p "plane1 = airport.take_off_plane(plane1)"; airport.take_off_plane(plane1)
puts
p "Airport::DEFAULT_CAPACITY.times {airport.land_plane(plane1)}"; Airport::DEFAULT_CAPACITY.times {airport.land_plane(plane1)}
puts
p "airport.land_plane(plane1)"; airport.land_plane(plane1)
puts
p "airpor."
puts
p
p
p
p
p
p
p
p
p
p

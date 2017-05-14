require './lib/airport'

airport = Airport.new
airport.instance_variable_set(:@weather_grade, 6)
plane_1 = Plane.new
plane_2 = Plane.new
plane_3 = Plane.new

airport.land(plane_1)
airport.land(plane_2)
airport.land(plane_3)

# show planes in airport 1
puts "planes landed: #{airport.planes}"

# show planes in airport 1 after one take-off
airport.plane_take_off
puts "planes after 1 take-off: #{airport.planes}"

# show planes in airport 1 after 2 take-offs
2.times { airport.plane_take_off }
puts "planes after 2 take-off: #{airport.planes}"

# Error: empty airport
# airport.plane_take_off

# Create airport with different capacity
airport_2 = Airport.new(10)
airport_2.instance_variable_set(:@weather_grade, 6)
puts "capacity airport 2: #{airport_2.capacity}"

# Land 10 planes (capacity) in airport 2
10.times { airport_2.land Plane.new }
puts " airport 2 planes: #{airport_2.planes}"

# Error: full airport
# airport_2.land Plane.new

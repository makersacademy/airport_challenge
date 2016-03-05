require './lib/plane.rb'
require './lib/airport.rb'

#--------
# setup
#--------

# create an airport
airport = Airport.new

# fill the airport with planes using .land
Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}

#--------
# operation
#--------

# set airport open: good weather
airport.closed = false

#instruct plane to take off
plane = airport.take_off

#check that plane has taken off
puts "Plane has taken off: #{plane.flying?}"                         #=> true

#check that plane is no longer in the airport
puts "Plane is no longer in airport: #{!airport.include?(plane)}"               #=> false

#instruct plane to land
airport.land(plane)

#check that plane has landed
puts "Plane has landed: #{!plane.flying?}"                         #=> false

# check that plane is in the airport
puts "Plane is in airport: #{airport.include?(plane)}"               #=> true

# set airport closed: bad weather
airport.closed = true

#instruct plane to take off - expect an error
begin
  plane = airport.take_off
rescue
  puts "Bad weather, plane cannot take off"
end

#check whether plane has taken off
plane.flying?                         #=> false


# instruct plane to land when airport closed - expect an error
begin
  airport.land(Plane.new)
rescue
  puts "Bad weather, plane cannot land"
end

#--------
# setup
#--------

# set airport open
airport.closed = false
# empty airport
airport.planes.count.times {plane = airport.take_off}


# fill airport to capacity
Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}

# try and land another plane - should generate an error
begin
  airport.land(Plane.new)
rescue
  puts "Airport full, plane cannot land"
end

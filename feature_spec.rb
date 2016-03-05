require './lib/plane.rb'
require './lib/airport.rb'

#--------
# setup
#--------

# create an airport
airport = Airport.new

# fill the airport with planes using .land
20.times {airport.land(Plane.new)}

#--------
# operation
#--------

# set airport open: good weather
airport.open = true

#instruct plane to take off
plane = airport.take_off

#check that plane has taken off
plane.flying?                         #=> true

#instruct plane to land
airport.land(plane)

#check that plane has landed
plane.flying?                         #=> false

# set airport closed: bad weather
airport.open = false

#instruct plane to take off
plane = airport.take_off

#check whether plane has taken off
plane.flying?                         #=> false


# instruct plane to land when airport closed - expect an error
airport.land(Plane.new)


#--------
# setup
#--------

# empty airport
airport.planes.count.times {plane = airport.take_off}


# fill airport to capacity
Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}

# try and land another plane - should generate an error
airport.land(Plane.new)

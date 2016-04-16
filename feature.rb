require_relative './lib/airport.rb'
require_relative './lib/plane.rb'

airport = Airport.new
plane = Plane.new

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport and confirm that it has landed 
# objects: plane, airport
# messages: land

plane.land(airport)

# plane will have a property whether in_air or not
# will return true or false	

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# objects: plane, airport
# messages: take off


# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 
# objects: weather
# messages: prevent takeoff

# def stormy_day
# 	x = rand(10)
# 	x < 2
# end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
# objects: weather
# messages: prevent landing

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
# objects: airport
# messages: prevent landing

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
# objects: airport capacity
# messages: set default that can be changed


















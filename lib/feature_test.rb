require_relative 'airport'

#require 'weather'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new

airport.confirm_landing(plane)

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new

airport.confirm_landing(plane)
airport.confirm_takeoff

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
require_relative 'airport'

airport = Airport.new
plane = Plane.new
weather = Weather.new

weather.condition = 55
airport.confirm_landing(plane)
airport.confirm_takeoff(weather)

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

require_relative 'airport'

airport = Airport.new
plane = Plane.new
weather = Weather.new

weather.condition = 55
plane.takeoff
airport.confirm_landing(plane, weather)
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

require_relative 'airport'

airport = Airport.new
plane = Plane.new
weather = Weather.new
weather.condition = 55
plane.landed
20.times{airport.apron << plane}
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport = Airport.new
airport.capacity
airport.capacity = 50
aciport.capacity

# Edge case tests
require_relative 'airport'

gatwick = Airport.new
gatwick.capacity = 5
luton = Airport.new
luton.capcity = 5
weather = Weather.new
weather.condition = 70
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new
plane6 = Plane.new

gatwick.confirm_landing(weather, plane1)
gatwick.confirm_landing(weather, plane2)
gatwick.confirm_landing(weather, plane3)
gatwick.confirm_landing(weather, plane4)
gatwick.confirm_landing(weather, plane5)
gatwick.confirm_landing(weather, plane6)

luton.confirm_landing(weather, plane6)

gatwick.confirm_takeoff(weather)
gatwick.confirm_takeoff(weather)
gatwick.confirm_takeoff(weather)
gatwick.confirm_takeoff(weather)

luton.confirm_landing(weather, plane1)
luton.confirm_landing(weather, plane2)
luton.confirm_landing(weather, plane3)
luton.confirm_landing(weather, plane4)

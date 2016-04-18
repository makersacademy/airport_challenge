require './lib/weather'
require './lib/plane'
require './lib/airport'

airport = Airport.new
plane_one = Plane.new
plane_two = Plane.new
plane_three = Plane.new

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#     and confirm that it has landed

  #can land a plane
  raise "error" unless airport.land(plane_one)

  #landing a plane sets its location to current airport
  airport.land(plane_two)
  raise "error" unless plane_two.location == airport

  #landing a plane should set landed? to true'
  airport.land(plane_three)
  raise "error" unless plane_three.landed? == true

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
#     and confirm that it is no longer in the airport

  # 0)taking off should set the plane's location to in_the_air
  airport.take_off(plane_one)
  raise "error" unless plane_one.location == 'in_the_air'
  puts "passed 0"

  # 1)taking off should set landed? to false
  airport.take_off(plane_two)
  raise "error 1" unless plane_two.landed? == false
  puts "passed 1"

  # 2)when landed is true the plane must be at an airport
  airport.land(plane_three)
  raise "error 2" unless plane_three.location == airport
  puts "passed 2"

  # 3)when location is not an airport landed? should be false
  raise "error 3" unless plane_three.landed? == false
  puts "passed 3"

  # 4)landed planes should be stored in the airport
  raise "error 4" unless airport.planes.include?(plane_three)
  puts "passed 4"

  # 5)planes which have taken off should no longer be in the airport
  airport.take_off(plane_one)
  raise "error 5" if airpot.planes.include?(plane_one)
  puts "passed 5"

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

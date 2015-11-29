 # require './lib/airport'
 # require './lib/plane'
 #
 #
 # # As an air traffic controller
 # # So I can get passengers to a destination
 # # I want to instruct a plane to land at an airport and
 # # confirm that it has landed
 #
 # airport = Airport.new
 # plane = Plane.new
 # airport.landing(plane)
 # plane.landed


 # As an air traffic controller
 # So I can get passengers on the way to their destination
 # I want to instruct a plane to take off from an airport and
 # confirm that it is no longer in the airport

# airport =  Airport.new
# plane = Plane.new
# airport.landing(plane)
# airport.take_off(plane)
# plane.landed

 # Airport <-- take_off --> Plane
 # Plane <-- landed? --> true/false



 # As an air traffic controller
 # To ensure safety
 # I want to prevent takeoff when weather is stormy

 # airport = Airport.new
 # plane = Plane.new
 # airport.landing(plane)
# airport.take_off(plane)

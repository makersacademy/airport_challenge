# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport and confirm that it has landed

# At this point, our plane is just a dummy object that does not do anything
class Plane end;
plane = Plane.new

airport = Airport.new
airport.receive_plane(plane)
p airport.planes

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

airport.release_plane(plane)
p airport.planes

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

p airport.check_weather
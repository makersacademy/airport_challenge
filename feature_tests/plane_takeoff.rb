# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new

airport.plane.take_off # confirms plane can take off
airport.plane.taken_off? # confirms plane has taken off

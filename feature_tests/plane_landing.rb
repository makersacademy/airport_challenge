# USER STORY
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane1 = Plane.new

airport.land(plane1) # lands plane
plane1.landed? # confirms plane has landed

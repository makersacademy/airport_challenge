require './lib/airport.rb'
require ',/lib/plane.rb'

# User Story 1
#Should ATC be the one to land
# controller = AirTrafficController.new
# controller.land(plane, airport)
heathrow = Airport.new
plane = Plane.new
#land plane
heathrow.land(plane)
#confirm plane has landed
#Check if necessay,
#Check if should be in Plane class
heathrow.plane_landed?(plane)
10.times {heathrow.land(Plane.new)}
heathrow.land(plane)
4.times {heathrow.land(Plane.new)}
heathrow.plane_landed?(plane)

# User story 2

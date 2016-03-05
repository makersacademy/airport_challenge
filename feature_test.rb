require './lib/airport.rb'
require './lib/plane.rb'
# require './lib/weather.rb÷'

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
heathrow.in_airport(plane)
10.times {heathrow.land(Plane.new)}
heathrow.land(plane)
4.times {heathrow.land(Plane.new)}
heathrow.in_airport(plane)

# User story 2
heathrow = Airport.new
plane = Plane.new
heathrow.land(plane)
heathrow.take_off(plane)
heathrow.in_airport?(plane)

#Extra tests, for one plane -> []
# last plane of many -> .pop
# plane in middle -> .delete(plane)

#User story 3

heathrow = Airport.new
plane = Plane.new
heathrow.land(plane)
10.times {heathrow.land(Plane.new)}
heathrow.land(plane)
#Random chance of take off
#error if bad weather
#take off
heathrow.take_off(plane)

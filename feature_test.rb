
# require './lib/weather.rb÷'

# User Story 1
#Should ATC be the one to land
# controller = AirTrafficController.new
# controller.land(plane, airport)
require './lib/airport.rb'
require './lib/plane.rb'
heathrow = Airport.new
plane = Plane.new
#land plane
plane.at_airport?#confirm plane not at aiport
heathrow.land(plane)
plane.at_airport? #confirm plane in airport after landing
#confirm plane has landed
#Check if necessay,
#Check if should be in Plane class


# # User story 2
# heathrow = Airport.new
# plane = Plane.new
# heathrow.take_off(plane)
# heathrow.land(plane)
# heathrow.in_airport?(plane)
# heathrow.take_off(plane)
# heathrow.in_airport?(plane)
#
# #Extra tests, for one plane -> []
# # last plane of many -> .pop
# # plane in middle -> .delete(plane)
#
# #User story 3
# require './lib/airport.rb'
# require './lib/plane.rb'
# heathrow = Airport.new
# plane = Plane.new
# heathrow.land(plane)
# #Random chance of take off
# #error if bad weather
# #take off
# heathrow.take_off(plane)


# require './lib/weather.rb÷'

# User Story 1
#Should ATC be the one to land
# controller = AirTrafficController.new
# controller.land(plane, airport)
require './lib/airport.rb'
require './lib/plane.rb'
heathrow = Airport.new
plane = Plane.new
plane.at_airport?#confirm plane not at aiport
heathrow.land(plane)
plane.at_airport? #confirm plane in airport after landing
#confirm plane has landed
#Check if necessay,
#Check if should be in Plane class


# User story 2
require './lib/airport.rb'
require './lib/plane.rb'
heathrow = Airport.new
plane = Plane.new
plane.at_airport? #plane not at airport
heathrow.take_off(plane) #raise error, no plane to take of f
heathrow.land(plane)#plane added to airport
plane.at_airport? #plane at airport
heathrow.take_off(plane)#plane can leave
plane.at_airport? #plane not at airport
#
# #Extra tests, for one plane -> []
# # last plane of many -> .pop
# # plane in middle -> .delete(plane)
#
#User story 3
require './lib/airport.rb'
require './lib/plane.rb'
heathrow = Airport.new

20.times do
  plane = Plane.new
  heathrow.land(plane)
  heathrow.take_off(plane)
  p plane.at_airport?
end
#Random chance of take off
#error if bad weather
#take off

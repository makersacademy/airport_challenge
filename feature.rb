require './lib/weather.rb'
require "./lib/plane.rb"
require "./lib/airport.rb"


airport = Airport.new
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
weather = Weather.new
# # As an air traffic controller
# # So I can get passengers to a destination
# # I want to instruct a plane to land at an airport and confirm that it has landed
#
 airport.accept_for_landing(plane1)
 airport.accept_for_landing(plane2)
 airport.accept_for_landing(plane3)
#
# # As an air traffic controller
# # So I can get passengers on the way to their destination
# # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

airport.accept_for_take_off(plane1)
airport.accept_for_take_off(plane2)
#
# # As an air traffic controller
# # To ensure safety
# # I want to prevent takeoff when weather is stormy

# # As an air traffic controller
# # To ensure safety
# # I want to prevent landing when weather is stormy

# # As an air traffic controller
# # To ensure safety
# # I want to prevent landing when the airport is full

# # As the system designer
# # So that the software can be used for many different airports
# # I would like a default airport capacity that can be overridden as appropriate

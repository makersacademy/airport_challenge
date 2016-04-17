# require "./lib/airport"
# require "./lib/plane"
#
# airport = Airport.new
# plane = Plane.new
# # As an air traffic controller
# # So I can get passengers to a destination
# # I want to instruct a plane to land at an airport and confirm that it has landed
#
# airport.accept_for_landing(plane)
# plane.landed?
# plane.reported_landed
#
# # As an air traffic controller
# # So I can get passengers on the way to their destination
# # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# airport.accept_for_take_off(plane)
# plane.took_off?
# plane.reported_landed    #(not sure at all)
#
# # As an air traffic controller
# # To ensure safety
# # I want to prevent takeoff when weather is stormy
# raise "It's too stormy to takeoff" unless stormy? == false
# # As an air traffic controller
# # To ensure safety
# # I want to prevent landing when weather is stormy
# raise "It's too stormy to land" unless stormy? == false
# # As an air traffic controller
# # To ensure safety
# # I want to prevent landing when the airport is full
# raise "Airport is full" if full?
# # As the system designer
# # So that the software can be used for many different airports
# # I would like a default airport capacity that can be overridden as appropriate

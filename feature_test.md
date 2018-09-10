# __Feature tests__ #


As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

load './lib/airport.rb'
load './lib/plane.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

airport.take_off(plane)

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

airport.take_off
RuntimeError: Can't land, too stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
-- I didn't do that one.


As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

storage = []
airport.land(plane) == storage << plane
airport.take_off(plane) == storage.pop

RaiseError : Can't land, too busy

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
-- I didn't do that one.

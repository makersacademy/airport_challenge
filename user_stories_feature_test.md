As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

  plane.land(airport)

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  plane.takeoff # plane not in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

  when weather = stormy
  plane.takeoff # error

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

  when weather = stormy
  airport.land(plane) # error

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

  when airport.full?
  airport.land(plane) # error

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

  airport = Airport.new(default_capacity_that_can_be_changed)

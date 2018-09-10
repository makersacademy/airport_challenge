Airport Challenge
-----------------

I have created two classes for Airport and Plane and numerous methods to try and simulate an air traffic control system at an airport.

Planes can land if:
- The weather is not stormy
- There is space in the airport
- The plane is in the air

Planes can take off if:
- The weather is not stormy
- The plane is not in the air


User stories
-------------

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

To see the code in action, open IRB and require the files:

$ irb
  > require './lib/airport'

Create a new airport:
  > london_airport = Airport.new

Create some planes:
  > red_plane = Plane.new
  > orange_plane = Plane.new
  > blue_plane = Plane.new

Land a plane:
  > london_airport.land_plane(red_plane)
If the weather is stormy, you may need to try landing the plane a few times.

Send a plane for take off:

  > london_airport.take_off(red_plane)
If the weather is stormy, you may need to try take_off a few times.

To check the airport information

  > london_airport

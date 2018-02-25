As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent `takeoff` when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent `landing` when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate


Classes:
1. Plane
2. Airport(airport_capacity = AIRPORT_CAPACITY)

Methods:
1. land_plane(airport)
2. take_off(airport)
3. gen_weather

Attributes:
1. plane_status (landed, airborne)
2. weather (stormy, clear)
3. airport_status (full, not_full)

Constants:
1. AIRPORT_CAPACITY

### User Stories

As an air traffic controller
So I can  get passengers to a destination
I want to instruct a plane to land at an airport.

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is
no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

### Verbs and Nouns
Nouns: Air traffic controller, passengers, plane, airport, capacity
Verbs: Land, take-off, is full?,  is stormy?, in air?

### What is Needed?
-----------------
* Classes: Airport, Plane
* Airport methods: land(plane), take_off(plane), full?, capacity variable default (can be overridden).
* Plane methods: in_air?
* A weather module 

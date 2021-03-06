TDD - the creation of classes and modules to satisfy the user stories

Use a random number generator to set the weather (mostly sunny with occasional storms)

Code should defend against edge cases
- Only take off from airport you are in
- Planes that are flying can't take off or be in an airport
- planes that are landed cannot land again and must be in an airport
- etc

Use a test stub for testing the random weather

keep a seperate file for each class, module, test suite

Code Review

- All tests passing
- High test coverage
- Code is elegant, every class has a clear responsibility, methods are short, etc...

Bonus = write an RSPEC feature test that lands and takes off a number of planes.


## User Stories

#### User Story 1
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

controller (user)
user --- instruct plane to land
airport --- plane has landed

>airport.request_to_land(plane)
>> "Plane has landed"

COMPLETED USER STORY
- created plane and airport class
- created test for airport and plane to exist
- tested airport responds to request to land method and wrote code to pass
- tested airport gives a confirmation message when request to land is passed with a plane as an argument


#### User Story 2
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

controller (user)
plane --- take off
plane --- has taken off
airport --- plan has taken off




#### User Story 3
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

controller (user)
plane --- request to land
airport(is full) ---- plane cannot land


#### User Story 4
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

developer
std airport - 10 planes
alt airport - 15 planes


#### User Story 5
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

controller (user)
plane --- request to take off
weather(is stormy)
airport --- cannot take off

#### User Story 6
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

controller (user)
plane --- request to land
weather(is stormy)
airport --- cannot land

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

COMPLETED USER STORY 1
- created plane and airport class
- created test for airport and plane to exist
- tested airport responds to request to land method and wrote code to pass
- tested airport gives a confirmation message when request to land is passed with a plane as an argument


#### User Story 2
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

controller (user)
user --- instruct plane to take off
airport --- plane has taken off

>airport.request_to_take_off(plane)
>> "Plane has taken off"

COMPLETED USER STORY 2
- created a request to take off method which takes plane as argument
- wrote test confirming airport responds to the methods
- wrote unit test that tests take off with a plane argument and provides confirmation message

#### User Story 3
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

controller (user)
plane --- request to land
airport(is full) ---- plane cannot land

```
>airport.request_to_land(plane)
>*airport is full*
>> "Plane cannot land, airport is full."
```
- request_to_land method already exists, so will add tests to that describe
- as using ruby version 2.6.5 cannot use self.private_method in class

COMPLETED USER STORY 3
- added new test in the request to land method to respond with cannot land if airport is full
- set airport to have a capacity of one plane
- created new instance variable @planes
- created new private method full to determine if the airport is full.
- take_off does not remove the plane from the places variable - future add on.


#### User Story 4
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

developer
std airport - 10 planes
alt airport - 15 planes

>Airport.new
>> airport_1, capacity = 10

>Airport.new(20)
>> airport_1, capacity = 20

- will create capacity as a readable piece of information
- will need to adjust tests on landing if creating default capacity greater than 10 (will set to only be a single airplane capacity)
- will need to adjust the @planes instance variable to be an array and adjust the full? method to accomodate the new capacity
- default capacity will be set as a constant.

COMPLETED USER STORY 4
- created a capacity instance variable which can be set at instance creation if needed.
- created a default capacity class constant
- adjusted @planes to be an array and adjusted full methods and landing methods to work with new instance variables


#### User Story 5
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

controller (user)
plane --- request to take off
weather(is stormy)
airport --- cannot take off

```
>airport.request_to_take_off(plane)
>airport.private.check_weather
>> Weather is Stormy
>> "Plane cannot take off"

>airport.request_to_take_off(plane)
>airport.private.check_weather
>> Weather is Sunny
>> "Plane can take off"
```

- will create weather class
- Weather is decided with rand 1-100 - 5% change of Storms

COMPLETED USER STORY 5
- created a weather module to generate random stormy or sunny weather
- created a private method stormy? and a conditional for taking off.
- added test and created stub for removing randomness during tests.

#### User Story 6
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

controller (user)
plane --- request to land
weather(is stormy)
airport --- cannot land


## Other

#### Diagram Board: https://miro.com/app/board/o9J_lQnY5pM=/

# Airport Challenge
The program allow traffic controllers to instruct a plane if it can land and take off from different airports, provided that the weather is sunny. It also allow system designers to manage how many planes can land in a specific airport.

## Motivation
This is the first Makers weekend challenge to be completed alone.
It aims at testing and consolidating all skills and concepts acquired through week 1.

## Planning
-  User Stories review
-  Objects needed: 'Plane'
    - Message needed: 'to land', 'take off', 'confirm'
    - Exceptions needed: 'prevent landing if airport is full', 'prevent takeoff if stormy', 'prevent landing'
-  Objects needed: 'Airport'
    - Message needed: 'capacity overridden'
    - Attribute needed: 'default airport capacity', 'storing plane objects'
- Method needed: 'weather'

## Installation
```
$ git clone https://github.com/sandyMax974/airport_challenge.git
$ cd airport_challenge
$ gem install bundle
$ bundle
```

## How to use?
```
$ pry
[1] pry(main)> require './lib/plane.rb'
```
### Instance methods available
`Plane class`
* `#land(airport)` - takes an argument 'airport' and if the weather is 'sunny' and there is available space lands the 'plane' object in the 'airport' hangar.  
* `#take_off(airport)` - takes an argument 'airport' and if the weather is 'sunny' it will remove the 'plane' object from the 'airport' hangar.  


`Airport class`
* `#weather` - return 'sunny' or 'stormy' based on an array sample.
* `#hangar_full?` - return 'true' if the quantity of object in the array is superior to the 'capacity' instance variable.
* `#modify_capacity(new_capacity)` - take an Integer to pass as the new capacity attribute.
* `#hangar` - returns the airport hangar array.

## Tasks
- [x] Fork directory
- [x] Create Domain Model based on User Stories
- [x] Apply TTD process to create objects
- [ ] Use random number generator to set the weather
- [x] Use stubs methods to override random behaviours
- [ ] Use a double to override random behaviours
- [x] Defend against edge cases
- [x] Use the Single Responsability Principle
- [x] Minimum coverage > 95%

### Edge cases:
- [x] planes can only take off from airports they are in;
- [x] planes that are already flying cannot take off and/or be in an airport;
- [ ] planes that are landed cannot land again and must be in an airport

## Difficulties encountered
- Struggled with use of double
- Struggled with use of stubs
- Struggled with 'Arrange' and 'Act' section on RSpec
- Struggled with setting up multiple regex match

## Unfinished
- When attempting to solve the test case for `Plane#in_flight? when the plane is already on the ground should not have an in-flight status`, it breaks my other test. I haven't figured out why but I suspect it is because my test are not isolated.

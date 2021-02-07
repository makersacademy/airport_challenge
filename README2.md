# Airport Challenge
The program let traffic controllers instruct plane if they can land and take off from different airports, provided that the weather is sunny. It also allow system designers to manage how many planes can land in a specific airport.

## Motivation
This is the first Makers weekend challenge to be completed alone.
It aims at testing and consolidating all skills and concepts acquired through week 1.

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
#### Instance methods available
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
- [ ] Defend against edge cases
- [x] Use the Single Responsability Principle
- [x] Minimum coverage > 95%

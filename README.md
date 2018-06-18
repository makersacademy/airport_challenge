# Makers Academy Week One - Airport Challenge
> 16-17 June 2018

First week (weekend) solo project, consolidating learning around OOP, TDD and
pair-programming. Closely followed a TDD approach, with all unit tests written
before methods according to user stories. The goal was to build a functioning
airport management system, landing/taking-off planes and managing their storage.
A random weather variable was also added, which raises errors if planes try to
land in stormy conditions.

[Full project details and user stories here.](https://github.com/makersacademy/airport_challenge)

## Completion

* All features fully implemented.
* All tests passing with 100% coverage.
* All methods ≤ 5 lines long.
* Code fully conforms to Rubocop style guide.

## Framework

Written in Ruby using Rspec for unit tests & irb for feature testing.

## Implementation

```shell
irb
require './lib/airport.rb'
airport = Airport.new # Creates new instance of Airport class
plane = Plane.new # Creates new instance of Plane class
airport.land_plane(plane) # Changes status of plane and pushes it to hangar
airport.hangar # Contents of hangar
airport.take_off_plane # Removes plane from hangar, changes status of plane
airport.weather.change_condition # Calls a random weather condition
```

## Further Improvements

* Allow for planes to accept airports as arguments & take over landing responsibility.
* Potential for further refactoring test code, add contexts.
* Potential for tightening the take-off/hangar management system.

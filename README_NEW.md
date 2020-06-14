# Airport Shmairport #

## What's been done: ##
User stories
- [x] tell a plane it can land at an airport
  - [x] create an airport
  - [x] create a plane
  - [x] method to land plane takes an argument (the plane)
- [x] instruct a plane to take off and confirm it is no longer at airport
  - [x] method to tell plane to take off
  - [x] array can be printed to check planes currently at airport
- [x] prevent plane from landing if airport full
  - [x] give airport maximum capacity
- [x] default airport capacity that can be overwritten
  - [x] set airport initialize argument 'capacity' as default and optional
- [] prevent take-off if the weather is stormy
  - [x] create weather class
  - [x] create function to choose random weather, stormy 1/10 times
- [] prevent landing if the weather is stormy

Edge cases
- [x] state of plane set to flying on initialize, to be checked before \ntake-off/landing
- [x] check array to make sure plane is in airport before take-off

WIP: Weather error for storms stopping take-off and landing has not been \nsuccessfully implemented yet.\n
I'm unsure whether the problem is in my use of stub method in the spec file, \nor the raising of the error.

##Things I'd like to have done:##
- Refactoring methods for SRP, especially `take_off`
- Got the BadWeatherError to raise


## How to use ##

> irb \n
> require '*/lib/airport.rb'

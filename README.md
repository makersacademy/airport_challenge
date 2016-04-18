[![Coverage Status](https://coveralls.io/repos/github/knowerlittle/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/knowerlittle/airport_challenge?branch=master)

##AIRPORT CHALLENGE
_________________________________

______
_\____\___
=  = ==(____MA____)
  \_____\___________________,-~~~~~~~`-.._
  /     o o o o o o o o o o o o o o o o  |\_
  `~-.__       __..----..__                  )
        `---~~\___________/------------`````
        =  ===(_________)

WEEKEND CHALLENEGE FOR WEEK 1 .
_________________________________
To build a program by TDD.
To Feature and Unit test each step of the process.
To use the SRP (Single Responsibility Principle) for program design.

##FILES
_________________________________
1. airport.rb
2. plane.rb
3. weather.rb
4. feature_test.rb

##FULFILLS ALL USER STORIES
_________________________________
  1. I want to instruct a plane to land at an airport and confirm that it has landed.
    (Shows the airport's apron with the new plane added)
  2. I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    (Shows the airport's apron once the plane has popped off)
  3. I want to prevent takeoff when weather is stormy
    (Raises error if weather conditions aren't met)
  4. I want to prevent landing when weather is stormy
    (Raises error if weather conditions aren't met)
  5. I want to prevent landing when the airport is full
    (Raises error when apron has reached DEFAULT_CAPACITY)
  6. I would like a default airport capacity that can be overridden as appropriate
    (DEFAULT_CAPACITY can be set with attr_accessor)

##EDGE CASES // Prevented by Guard Conditions
_________________________________
  1. Planes only take off from airports they are in
  2. Planes cannot be in more than one airport at once.
  3. Flying planes cannot take off.
  4. Landed planes cannot land.
  5. All planes in airport have flight status set to false
  6. All flying planes have flight status set to true

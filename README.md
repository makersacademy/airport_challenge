Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Create a programme to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

The aim of this challenge is to - 
- Test drive the creation of a set of classes to staisfy the user stories
- Use a stub to ensure consistent test behaviour
- The code should defend against edge cases
- Learn how to use test doubles


How to use
-------

- Clone this repo to your machine
- Run bundle
- Run from the terminal

```
require './lib/airport'
airport = Airport.new
=> airport @airport=[], @capacity=10, @weather=Weather.new
plane = Plane.new
=> plane

airport.lane(plane)
=> [plane]
airport.take_off 
=> plane
11.times { airport.land(plane) }
=> Error - Airport full, can't land
```

User Stories
-----

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

### Status
- I got up to and completed the user story asking to prevent landing if the airport is full 
- All tests are passing
- Test coverage is 96.23%

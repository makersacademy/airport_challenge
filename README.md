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

Coverage
----------

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)

Features
---------
**Airport Class**
* Planes can land and take-off at an airport
* Planes cannot take-off at an airport they're not at
* Planes cannot land or take-off if the weather is stormy
* Planes will stay at airport once landed
* Planes will leave airport after take-off
* Airports can contain multiple planes (no limit)

**Plane Class**
* Planes can fly!
* Planes will leave airport once flying
* Planes can land!
* Planes will stay at airport once landed
* Planes cannot fly if already flying
* Planes cannot land if already landed

**Weather Class**
* Weather can be 'sunny', or 'stormy'
* 20% chance of stormy weather

User Stories
-----

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

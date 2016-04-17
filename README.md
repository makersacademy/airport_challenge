Travis CI

[![Build Status](https://travis-ci.org/OMGDuke/airport_challenge.svg?branch=master)](https://travis-ci.org/OMGDuke/airport_challenge)

Coveralls

[![Coverage Status](https://coveralls.io/repos/github/OMGDuke/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/OMGDuke/airport_challenge?branch=master)

Airport Challenge
=================


                           888L
                            888b
                            ^8888.
                             '8888c
                              88888L
               "8b             :8888b
                *8b             888888
                =88888888888888888888888888888a
                488"""""""""""" 888888""""""""
               .88             488888%
                "             .88888"
                              8888P
                             d888F
                            J888"
                           4888"
                          ,88P

Features
----
Allows for the creation of new airports with custom capacities.
Allows for the takeoff and landing of planes.
Protects against landing and takeoff if the weather is bad.
Checks plane status to ensure they are in the air before attempting landing.
Checks plane status to ensure they are on the ground in the airport before attempting takeoff from that airport.
Stops takeoff if there are no planes at the airport.
Stops landing if the airport is full.
Allows for checking the planes current flight status.

Commands
----
*Airport*

When initializing a new airport provide a capacity as an argument to set a custom capacity. Providing no Argument sets the capacity to 5.

`airport.takeoff(plane)` - If the plane is at the airport and the weather is suitable this method causes the provided plane to take off.

`airport.land(plane)` - If the plane is in the air and the weather is suitable this method causes the provided plane to land at the current airport as long as there is room.

*Plane*

`plane.ground` -  Returns true if the plane is currently on the ground or false if it is in the air.


Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

**BONUS**

* RSpec feature test included to work through the user stories.

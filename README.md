Airport Challenge 
=================
Travis says..... ![travis build status](https://travis-ci.org/kennbarr/airport_challenge.svg?branch=master)

```
                                4eec
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

```

Approach
---------

* Created Airport, Plane and Weather classes.

######Airport
* Airports store Planes in an array. Custom capacity can be set when creating a new Airport, default is 10.
* Airports check: plane is airborne, airport is not full and weather is not stormy before permitting a plane to land
* Airports check: plane is not already airborne, plane is in this airport and weather is not stormy before permitting a plane to take off

######Plane
* Planes have a predicate method 'landed?' that returns *true* if landed and *false* if airborne
* This 'landed?' state can be changed by calling the 'land' and 'take_off' methods on a plane

######Weather
* The purpose of this class is to randomise the weather to occasionally result in stormy conditions
* Calling 'stormy?' on an instance of Weather has a 20% probability of returning true

Issues
-------

* Had to make code more complicated in order to make method testable.
  1. Redundant optional argument "weather" added to Airport initialize method in order to be able to get test coverage of stormy? method
  2. "Kernel.rand" had to be used in place of "rand" in order to be able to stub the random results

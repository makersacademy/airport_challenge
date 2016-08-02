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

Summary
---------

* Created Airport, Plane and Weather classes. 100% tested and passed feature tests

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

* Had to make code more complicated in order to make some methods testable.
  1. Redundant optional argument "weather" added to Airport initialize method in order to be able to get test coverage of Airport.stormy?
  2. "Kernel.rand" had to be used in place of "rand" in Weather.stormy? to be able to stub the random result

Sample Interface
-------

######Planes can land and take off from airport. Can confirm if plane in airport
```
$ irb
2.3.0 :001 > airport = Airport.new
 => #<Airport:0x007ffc32092b40 @capacity=10, @planes=[], @weather=#<Weather:0x007ffc32092af0>>
2.3.0 :002 > plane = Plane.new
 => #<Plane:0x007ffc32068138 @landed=false>
2.3.0 :003 > airport.has?(plane)
 => false
2.3.0 :004 > airport.land(plane)
 => [#<Plane:0x007ffc32068138 @landed=true>]
2.3.0 :005 > airport.has?(plane)
 => true
2.3.0 :006 > airport.take_off(plane)
 => #<Plane:0x007ffc32068138 @landed=false>
2.3.0 :007 > airport.has?(plane)
 => false
```

######Airport can be initialized with custom capacity and reject landings when full
```
$ irb
2.3.0 :001 > airport = Airport.new(3)
 => #<Airport:0x007f83db105ae8 @capacity=3, @planes=[], @weather=#<Weather:0x007f83db105ac0>>
2.3.0 :002 > 3.times {airport.land(Plane.new)}
 => 3
2.3.0 :003 > airport
 => #<Airport:0x007f83db105ae8 @capacity=3, @planes=[#<Plane:0x007f83db0c7220 @landed=true>, #<Plane:0x007f83db0c71d0 @landed=true>, #<Plane:0x007f83db0c7180 @landed=true>], @weather=#<Weather:0x007f83db105ac0>>
2.3.0 :004 > airport.land(Plane.new)
RuntimeError: Cannot land as airport is full
```

######Weather is random and stormy weather prevents landing and take off
```
$ irb
2.3.0 :001 > airport = Airport.new
 => #<Airport:0x007f83db00eb30 @capacity=10, @planes=[], @weather=#<Weather:0x007f83db00eb08>>
2.3.0 :002 > plane1, plane2, plane3 = Plane.new, Plane.new, Plane.new
 => [#<Plane:0x007f83db027388 @landed=false>, #<Plane:0x007f83db027360 @landed=false>, #<Plane:0x007f83db027338 @landed=false>]
2.3.0 :003 > airport.land(plane1)
 => [#<Plane:0x007f83db027388 @landed=true>]
2.3.0 :004 > airport.land(plane2)
RuntimeError: Plane cannot land due to storm
2.3.0 :005 > airport.land(plane3)
 => [#<Plane:0x007f83db027388 @landed=true>, #<Plane:0x007f83db027338 @landed=true>]

2.3.0 :006 > airport.take_off(plane1)
=> #<Plane:0x007f83db027388 @landed=false>
2.3.0 :007 > airport.take_off(plane3)
RuntimeError: Plane cannot take off due to storm
```

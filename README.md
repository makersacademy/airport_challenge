Airport Challenge
=================

Introduction
---------

This project aims to replicate a working airport system, built using Ruby. Rspec is used throughout to test all methods.

Features modeled include the following:

* The ability to create (virtually) unlimited airports and planes.
* The ability to order planes to land at/take-off from specified airports.
* The ability to confirm whether a plane landed at/took-off from a specified airport.
* A randomized weather system which is usually sunny, but occasionally stormy, during which times planes will be unable to take-off or land.
* A default maximum capacity of 30 planes for newly created airports, which can be overridden at the time of airport creation.
* Naturally it is impossible to land/create a plane at an airport which is currently at full capacity.

This is a solo project, created for the Makers Academy week 1 weekend challenge.


Instructions
---------

1. Firstly open Terminal, ```cd``` in to the directory containing this project and run ```irb```, or any similar REPL.
2. Require the necessary files using:

```
require './lib/airport'
require './lib/plane'
require './lib/weather'
```
3. To create an airport use...

```
airport = Airport.new
```

...to create an airport with the default capacity of 30 planes, or pass an integer argument such as...

```
airport = Airport.new(10)
```

...to override the default capacity and set it to the given argument.

4. To create a plane use...

```
plane = Plane.new(airport)
```

...where ```(airport)``` is the name of the previously created airport at which you wish to create the plane. Note that this argument is non-optional, as an airport will always have to be specified to create a plane at. In the case that the airport specified is already at full capacity the following error will be raised: ```'There is no room at the airport.'```. To make room to create further planes, either create additional airports or order any planes currently landed at the specified airport to take-off.

5. To order a plane to take-off, use...

```
plane.take_off(airport)
```

...and if that plane is currently landed at the specified airport it will take-off, providing that the weather is not stormy. If the weather is stormy the following error will be raised: ```'The weather is too stormy to take-off.'```. In this instance keep giving the order to take-off until the stormy weather has cleared. If the plane is not currently landed at the specified airport the following error will be raised: ```'This plane is not at the given airport.'```. If the specified plane is already flying the following error will be raised: ```'This plane is already flying.'```.

6. Once the order had been given for a plane to take-off you can confirm that it has successfully taken-of using...

```
airport.confirm_plane_taken_off(plane)
```

...which will return ```true``` if the plane has taken off, or ```false``` if the plane is still landed at the specified airport. If the given plane has never been at the airport in question, the following error will be raised: ```'That plane has never been at this airport.'```.

7. To order a plane to land, use...

```
plane.land(airport)
```

...and providing the weather is not stormy, and providing that the specified airport is not at maximum capacity, the plane will land at the specified airport. If the weather is stormy then the following error will be raised: ```'The weather is too stormy to land.'```. In this instance keep giving the order to land until the stormy weather has cleared. If the specified airport is at maximum capacity the following error will be raised: ```'There is no room at the airport.'```. In this instance any planes currently landed at the specified airport will have to be ordered to take-off before any further planes can land there. Alternatively further airports can be built to land any flying planes at. In the instance that the specified plane is already landed at an airport the following error will be raised: ```'This plane has already landed.'```.

8. Once the order to land the plane has been given, you can confirm that it has successfully landed using...

```
airport.confirm_plane_landed(plane)
```

...which will return ```true``` if the plane has landed at the specified airport, or ```false``` if the plane is still flying. If the given plane has never been at the airport in question, the following error will be raised: ```'That plane has never been at this airport.'```.

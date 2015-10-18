

Airport Challenge [![Build Status](https://travis-ci.org/hsheikhm/airport_challenge.svg?branch=master)](https://travis-ci.org/hsheikhm/airport_challenge)
=================

* [Task](#task)
* [My Approach](#my-approach)
* [Feature Test Sample](#feature-test-sample)

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So planes can land safely at my airport
I would like to instruct a plane to land

As an air traffic controller
So planes can take off safely from my airport
I would like to instruct a plane to take off

As an air traffic controller
So that I can avoid collisions
I want to prevent airplanes landing when my airport if full

As an air traffic controller
So that I can avoid accidents
I want to prevent airplanes landing or taking off when the weather is stormy

As an air traffic controller
So that I can ensure safe take off procedures
I want planes only to take off from the airport they are at

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a flying plane cannot take off and cannot be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that is not flying cannot land and must be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that has taken off from an airport is no longer in that airport
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Please create separate files for every class, module and test suite.

The submission will be judged on the following criteria:

* Tests pass
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.


My Approach
------------


Feature Test Sample
--------------------
```
<!-- Airport object: -->
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fb92a89c9a8 @planes=[], @capacity=20>
<!-- Plane object: -->
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fb92a88ec18 @status=:flying, @location=:air>
<!-- Airport can land a plane. Plane status = 'landed' and location = 'airport' -->
2.2.3 :004 > airport.land(plane)
 => #<Plane:0x007fb92a88ec18 @status=:landed, @location=:airport>
<!-- Airport can take-off a plane. Plane status = 'flying' and location = 'air' -->
2.2.3 :005 > airport.take_off
 => #<Plane:0x007fb92a88ec18 @status=:flying, @location=:air>
<!-- Plane cannot land if the airport is full: -->
2.2.3 :028 > airport.land(plane)
RuntimeError: Airport is full!
2.2.3 :027 > airport.full?
 => true
<!-- Plane cannot land if weather is stormy: -->
2.2.3 :042 > airport.land(plane)
RuntimeError: Landing denied. Weather is stormy!
<!-- Plane cannot take-off if weather is stormy: -->
2.2.3 :052 > airport.take_off
RuntimeError: Take-off denied. Weather is stormy!
<!-- Airport can have a specific capacity: -->
2.2.3 :053 > airport = Airport.new(50)
 => #<Airport:0x007f9604181630 @planes=[], @capacity=50>
<!-- Plane cannot land if it has already landed: -->
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fdeaa1e5ad8 @status=:flying, @location=:air>
2.2.3 :004 > airport.land(plane)
 => #<Plane:0x007fdeaa1e5ad8 @status=:landed, @location=:airport>
2.2.3 :005 > airport.land(plane)
 => "Plane has already landed"
<!-- A plane taken-off from an airport is no longer in that airport: -->
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007ff0ca13bf10 @status=:flying, @location=:air>
2.2.3 :004 > airport.land(plane)
 => #<Plane:0x007ff0ca13bf10 @status=:landed, @location=:airport>
2.2.3 :005 > airport.planes
 => [#<Plane:0x007ff0ca13bf10 @status=:landed, @location=:airport>]
2.2.3 :006 > airport.take_off
 => #<Plane:0x007ff0ca13bf10 @status=:flying, @location=:air>
2.2.3 :007 > airport.planes
 => []
```

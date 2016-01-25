#Russell Vaughan - Airport Challenge
====================================

Last Edited
------------
January 25th 2016

Author
---------------
Russell Vaughan

Program Synopsis
----------------
Airport Challenge is an Air Traffic Control simulator that allows you control the traffic at a simulator airport. The program allows you to depart and land planes into an airport based on external factors such as weather and capacity.

Example Program:
-----------------

Scenario 1

2.2.3 :028 > airport = Airport.new
 => #<Airport:0x007fa154051728 @planes=[], @capacity=10> 
2.2.3 :029 > plane = Plane.new
 => #<Plane:0x007fa15403a618 @flying=false> 
2.2.3 :030 > airport.land(plane)
 => [#<Plane:0x007fa15403a618 @flying=false>] 
2.2.3 :031 > airport.depart(plane)
 => true 

Scenario 2

2.2.3 :006 > airport = Airport.new
 => #<Airport:0x007fa153827c00 @planes=[], @capacity=10> 
2.2.3 :007 > plane = Plane.new
 => #<Plane:0x007fa1540d1630 @flying=false> 
2.2.3 :008 > airport.land(plane)
RuntimeError: unsafe flying conditions to land



Learning Objectives:
---------------------

The purpose of this challenge is to expand on the learnings from the Boris Bikes challenge. At the heart those challenges were learning Test Driven Development and Effective Pairing, although this challenge will be undertaken solely by me.

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

Create a set of classes modules for the above user stories.
Use Random number generator to set the weather.
Use a stub to override random ewather to ensure consitent test behaviour
defend edge cases (planes can only take off from aiports that they are in, planes that are already flying cannot take off or be in an aiport, planes that are landed cannot land again and must be in an aiport)

----------------------------

Expectations:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Key Learnings From Challenge
---------------------------
Effective TDD Development (Red, Green, Refactor)
Stubbing Test Elements to simulate desired test conditions.
Using Modules within programs
Ruby Syntax





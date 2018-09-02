# Airport Challenge
===================
This program models an airport from the user-perspective of an air traffic controller.  

## Task:
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Test drive the creation of a set of classes/modules to satisfy all user stories below using a random weather generator to set the weather (it is normally calm but on rare occasions it may be stormy). The tests will need you to use a stub to override random weather to ensure consistent test behaviour.

## Requiements: 
User (air traffic controller) Requirements
* UR1 Instruct a plane to land at an airport
* UR2 Instruct a plane to take off from an airport and confirm it's no longer in the airport
* UR3 Prevent takeoff when weather is stormy 
* UR4 Prevent landing when weather is stormy 
* UR5 Prevent landing when the airport is full 

System (administrator) Requirements:
* SR1 Default airport capacity that can be overridden as appropriate

## Code Review:
- All tests passing / high test coverage (>95% is good)
- The code is elegant: every class has a clear responsibility, methods are short etc.
- Reviewers will potentially be using this [code review rubric](docs/review.md).  
Code defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

[![Build Status](https://travis-ci.org/rodcul/airport_challenge.svg)](https://travis-ci.org/rodcul/airport_challenge)

Airport Challenge
=================

To-do list
----------

* [x] Land plane
* [x] Take off plane
* [x] Disallow landing when airport is full
* [x] Prevent landing when stormy

Log
--------

### Friday 1st May 2015 - 16:00 pm

* After watching @tansaku masterclass on doubles I was able to use mock stubs to override the "random_weather" method that was used to set weather = calm so we can land planes

### Friday 1st May 2015 - 15:00 pm

* Discussed with Alumni how to check status of plane after taking off. Had to create my first unit test to test "takeoff" method for plane.

### Friday 1st May 2015 - 13:30 pm

* Worked with Tom Coakes on Rspec syntax
* Got [simplecov](https://github.com/colszowka/simplecov) setup locally
* attr_accessor finally makes sense to me

### Friday 1st May 2015 - noon

* After discussing with mentors & reading [TDD is dead. Long live testing. by DHH](http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html) I plan to try and write feature tests only and achieve 100% code coverage.
* Unit tests will be written retrospectively as a learning excercise (I understand they will be important as we work on more complex systems).
* The plan is to follow RED > GREEN > REFACTOR and reflect this in my commits.



Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```


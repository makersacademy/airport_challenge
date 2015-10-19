Airport Challenge
=================

[![Build Status](https://travis-ci.org/forty9er/airport_challenge.svg?branch=master)](https://travis-ci.org/forty9er/airport_challenge)


### Usage

Navigate to the root directory of the project in terminal. 
Ensure that you have required the files contained within the 'lib' directory in your Ruby environment.

Airports
--------

Airports are containers for planes. 
They must be passed a string defining their name when creating them. 

```
my_airport = Airport.new('My Airport')
```

They have a default capacity which can be over-ridden on creating an Airport instance. 

```
my_airport = Airport.new('My Airport',2000)
```

They know when they are full to capacity and will not let any further planes land. Infact, attempting to do so will raise an error.

You can query what planes are located at an airport, which will return an array containing the plane objects.

```
my_airport.planes
```


Planes
------

Most of the work is done by Plane objects. 
Plane objects are created very simply:

```
my_plane = Plane.new
```

Initially, planes are flying. They do not know their location while they are flying.
Their location and flying status can be queried at any time.

```
my_plane.location
my_plane.flying
```

To land at a 'my_airport', you can call the land method on the plane.

```
my_plane.land(my_airport)
```

Taking off is similar to landing:

```
my_plane.take_off(my_airport)
```

HOWEVER: You cannot land or take off at an airport if the weather is stormy. 

Weather
------

Weather is a module which is included in the Plane and Airport classes.
Most of the time it is sunny, but occasionally it is stormy.

The 'weather' method can be called on both airports and planes at any time, and it will report the weather in that location. Note though, that the weather can change during the time between checking it and trying to land/take off! It is checked in the background every time you try to land or take off.

```
my_airport.weather
my_plane.weather
```


### Todo

* Name subject explicitly with 'described_class'.
* Incorporate 'before' blocks.
* Remove redundant 'respont_to' tests.
* Refractor conditionals.
* Ensure errors are returned and not strings.
* Review public/private methods and adjust accordingly.
* Ensure no methods/variables are exposed where they should not be (eg. Plane.flying)
* Consider moving the 'land' and 'take_off' methods from the Plane class to the Airport class (see below)
* Consider sometimes stubbing subject in tests rather than doubles.
* Check that all edge tests have been covered.
* Write the bonus feature test.

* In retrospect, looking at the user stories I think I should have implemented the 'land' and 'take-off' methods in the airport class. This is because the user stories have been written from the point-of-view of the air-traffic controller, rather than the pilot of the plane. Perhaps in time I can re-write the challenge this way round.


### Technologies used

Ruby
TDD (via RSpec)


### Original challenge instructions

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning
* If you do not submit a pull request, we will not be able to see your progress

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (edit week 1 - you can edit directly on Github)
2. Fork this repo, and clone to your local machine
3. run the command `gem install bundle`
4. When the installation completes, run `bundle`
3. Complete the following task:

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

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

The submission will be judged on the following criteria:

* Tests pass
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **You should pay attention to these - the results will be added to your pull request**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

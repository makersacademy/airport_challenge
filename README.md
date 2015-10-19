[![Build Status](https://travis-ci.org/DeathRay1977/airport_challenge.svg)](https://travis-ci.org/DeathRay1977/airport_challenge)
Airport Challenge
=================

My approach to the challenge was pretty much like the Boris Bikes Challenge. The Airport was the main class of the system that heald a collection of planes which are derived from the Plane class. The Airport Class is responsible for making planes take off and land adding them or taking them out of the collection and changing their 'flight' status and location. The Airport class also takes care of the edge cases such as:

* Planes not being able to operate in bad weather.
* Planes cannot land if already landed.
* Planes cannot land if landed at another airport.
* Planes cannot land if the airport is full.
* Planes cannot take off if already in the air.
* Planes cannot take off if not landed at your airport.

Airports have the following internal state:

* A name - Read Only
* A Maximum Capacity (defaulted to a value if not supplied) - Read Only
* A Hangar (Collection of Planes). - Read only (but writable via public methods)

Planes are very things. They have the following internal state.

* An ID - Such as "BA535" - Read Only.
* A current location. Set to the name of the airport it has landed at or nil if in flight. Read/Write through attr_accessor.
* A flying status. Set to true if in the air, false otherwise. Read/Write through attr_accessor.

The feature spec contains one test for each User Story. Some of these tests are replicated from airport_spec.rb but the tests for the Airport class uses doubles and mocks and not real planes. 

I have attempted the bonus challenge by landing and taking off the maximum amount of planes from an airport with the default capacity. 

Instructions
---------

* Create an instance of the Airport class passing the name of the airport, a weather object and an [optional] capacity.
* Create instances of the Plane class passing its ID.
* Pass the plane objects to the take_off or land method on the airport object to make them fly of land.

Task
-----

Below is an outline of the task given to us.

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

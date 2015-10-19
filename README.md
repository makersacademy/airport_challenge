Airport Challenge
=================
Objective

This challenge involved creating planes (plane objects) that could take off and land at airports.

Model description

Planes have been given a status of landed or flying and airports can order a plane to land and take off. Airports have a capacity and so a plane cannot land in a full airport.  The model also includes a random weather generator, when the weather is stormy a plane cannot take off from or land at any airport.

Technologies used

Ruby v.2.0.0
Rspec

Instructions




----------------------------------------------------------------------------------




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

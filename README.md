Airport Challenge  [![Build Status](https://travis-ci.org/tigretoncio/airport_challenge.svg?branch=master)](https://travis-ci.org/tigretoncio/airport_challenge)
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )  SERGIO ENRECH TRILLO
                `---~~\___________/------------`````
                =  ===(_________)

```

Solution
---------
This repo contains the solution to the Airport Challenge exercise.

To resolve this exercise a TDD approach has been adopted.  From the user stories two main objects have been identified, Plane and Airport.

* a Plane simply keeps a status on whether is landed or not, using a boolean, and has two methods, land and take off, which switch that status.  By default a new Plane is in an undetermined status (nil), until one of those two methods are called.

* an Airport manages the traffic of different planes.  It captures the list of planes currently at the airport using an array named "planes".  It then manages planes with the methods land and takeoff, which are subject to the different conditions exposed in the user stories.  Basically the planes can't land or take off if the weather is stormy, and planes can't land if airport is full.  Of course, a plane can't land if it's already on ground, and can't take off if it is not at the airport.  No other edge cases have been considered as we have made sure that one a plane takes off, it disappears from the airport log.

As not specified by the user, it is important to precise that the following priorities have been implemented for the special conditions applied:

* if inconsistencies are detected, the program raise this as exception, regardless of the weather or the capacity of the airport
* if no inconsistencies but weather is stormy, that is raised as exception, regardless of current capacity of airport
* if not of the above conditions, then the capacity constraint is checked.

The test coverage is of 98.28, only 2 lines have remained untested, the ones to create the random number and the boolean variable to determine if weather is stormy within the module Weather.  It is trivial code so no further effort has been made to increase coverage.

Regarding tests a pragmatic approach has been taken in order to ensure the majority of cases where covered trying not to fall onto vacuous tests.  For example, for testing full capacity, the same double plane has been stored in memory to fulfill the capacity of the airport.  Although this would not be possible in the software working due to other tests preventing to land an already landed plane, it did not matter for the test, we just needed elements fulfilling the capacity of airport, and perhaps there are other methods of increasing airport capacity not involving the .land method.

It was also very important to stub the random weather generator for the relevant test cases, when testing cases with higher priority than weather, to avoid that the tests could pass or fail randomly depending on the weather random result.

I find Travis CI a moody website and application  It did not worked during all weekend, I got a ERR_CONNECTION_TIMED_OUT on the web page.  It worked early Morning so I added the badge as recommended.

Finally, it has been considered that the probability of Stormy weather is .1.  This has been achieved generating a random number between 0 and 9, and assigning the Stormy condition if the number is 9.

Feature test example
---------
new airport, a plane lands, it tries to take off but weather conditions are stormy
```
2.2.3 :001 > plane = Plane.new
 => #<Plane:0x00000001f96db0>
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x00000001de20f0 @planes=[], @capacity=20>
2.2.3 :003 > plane.landed?
 => nil
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x00000001f96db0 @landed=true>]
2.2.3 :006 > airport.takeoff(plane)
RuntimeError: stormy weather
  from /home/sergio/Ronin/Week1/airport_challenge/lib/error_mgr.rb:10:in `check_errors'
  from /home/sergio/Ronin/Week1/airport_challenge/lib/airport.rb:15:in `takeoff'
  from (irb):6
  from /home/sergio/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :007 > airport.takeoff(plane)
 => #<Plane:0x00000001f96db0 @landed=false>

```




Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (edit week 1 - you can edit directly on your Github fork)
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle`
3. Complete the following task:

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

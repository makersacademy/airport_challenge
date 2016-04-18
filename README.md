Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Approach
---------

This repository contains a solution to the Fly! Weekend challenge excerice for Week 1 at Makers Academy.

A TDD approach was adopted to convert the User Stories into a programme. At first 3 main objects were taken from the Airport, Plane and Weather. However, with refactoring I decided to convert Weather from a class into a module after the Code Review with peers. I interpretted the User Story as just being from the Air traffic controller and therefore, there was no instruction from a pilot to the plane itself. I deliberated this for a while and decided to build my program in the Airport class with a class Plane that would be empty.

An instance of an airport manages traffic departing and landing at an airport. The airport will not allow planes to land or take off if the weather is stormy. The airport  stores planes that has landed, and deletes them when they take off. I use this information to make sure that the case cases are covered, ie it raises an error if a plane has been told to land if it has landed and likewise for take off.

In the tests I have utilised a stubb to deal with the random weather function. If this was not implemented then the tests would pass or fail randomly.

Feature test example
Two planes are created and told to land. Then the first planes takes off and is removed from the inventory of the airport. When you attempt to tell that plane to take off again, it fails.

2.2.3 :001 > require './lib/airport.rb'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007f95d305bb10 @planes=[], @capacity=20>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007f95d3050fa8>
2.2.3 :004 > airport.land(plane)
 => [#<Plane:0x007f95d3050fa8>]
2.2.3 :005 > plane1 = Plane.new
 => #<Plane:0x007f95d189c6f0>
2.2.3 :006 > airport.land(plane1)
 => [#<Plane:0x007f95d3050fa8>, #<Plane:0x007f95d189c6f0>]
2.2.3 :007 > airport.take_off(plane)
 => #<Plane:0x007f95d3050fa8>
2.2.3 :008 > airport.planes
 => [#<Plane:0x007f95d189c6f0>]
 2.2.3 :009 > airport.take_off(plane)
RuntimeError: Plane is not in airport
  from /Users/robin_heathcote/Projects/Makers Academy/Week 1/Fly! Weekend Challenge/airport_challenge/lib/airport.rb:28:in `take_off'
  from (irb):9
  from /Users/robin_heathcote/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :010 >


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

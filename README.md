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

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

My final commit to the Airport challenge.

My approach to this challenge was to test as much as possible in as many small steps as possible. Setting up thorough tests that I understood which presented me with coding challenges for myself to solve. As far as possible I have tried to break the code down after passing a test to make it read like English, and keeping it DRY, trying never to repeat myself.

I believe I have completed all the user stories whilst covering a few edge cases such as plane duplication at an Airport (I didn't notice this part until late, so didn't get through many). I also decided to introduce a name initialiser for the Planes as I felt it helped make the error codes more readable.

Example:

Heathrow = Airport.new
plane1 = Plane.new("Plane 1")
plane2 = Plane.new("Plane 2")
plane3 = Plane.new("Plane 3")
Heathrow.land(plane1)
Heathrow.land(plane2)
Heathrow.land(plane3)
Heathrow.hangar
Heathrow.take_off(plane1)
Heathrow.take_off(plane1)
Heathrow.take_off(plane2)
Heathrow.hangar

HX3084T1:airport_challenge thomas.lightfoot$ irb
2.5.1 :001 > require './lib/Airport.rb'
 => true
2.5.1 :002 > Heathrow = Airport.new
 => #<Airport:0x00007f8c4c0d36a0 @hangar=[], @capacity=20>
2.5.1 :003 > plane1 = Plane.new("Plane 1")
 => #<Plane:0x00007f8c4c0ca280 @name="Plane 1">
2.5.1 :004 > plane2 = Plane.new("Plane 2")
 => #<Plane:0x00007f8c4c0c4d80 @name="Plane 2">
2.5.1 :005 > plane3 = Plane.new("Plane 3")
 => #<Plane:0x00007f8c4c0a5070 @name="Plane 3">
2.5.1 :006 > Heathrow.land(plane1)
 => [#<Plane:0x00007f8c4c0ca280 @name="Plane 1">]
2.5.1 :007 > Heathrow.land(plane2)
 => [#<Plane:0x00007f8c4c0ca280 @name="Plane 1">, #<Plane:0x00007f8c4c0c4d80 @name="Plane 2">]
2.5.1 :008 > Heathrow.land(plane3)
Traceback (most recent call last):
        3: from /Users/thomas.lightfoot/.rvm/rubies/ruby-2.5.1/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/thomas.lightfoot/Projects/airport_challenge/lib/Airport.rb:17:in `land'
RuntimeError (BAD WEATHER: can't land)
2.5.1 :009 > Heathrow.hangar
 => [#<Plane:0x00007f8c4c0ca280 @name="Plane 1">, #<Plane:0x00007f8c4c0c4d80 @name="Plane 2">]
2.5.1 :010 > Heathrow.take_off(plane1)
 => #<Plane:0x00007f8c4c0ca280 @name="Plane 1">
2.5.1 :011 > Heathrow.take_off(plane1)
Traceback (most recent call last):
        3: from /Users/thomas.lightfoot/.rvm/rubies/ruby-2.5.1/bin/irb:11:in `<main>'
        2: from (irb):11
        1: from /Users/thomas.lightfoot/Projects/airport_challenge/lib/Airport.rb:26:in `take_off'
RuntimeError (Plane 1 isn't in the hangar)
2.5.1 :012 > Heathrow.take_off(plane2)
 => #<Plane:0x00007f8c4c0c4d80 @name="Plane 2">
2.5.1 :013 > Heathrow.hangar
 => "empty"

 ^^^
 The above shows a full use of my application. Landing multiple planes in the airport, preventing a landing due to bad weather, a few planes taking off including a RuntimeError showing how a plane can't take off more than once finally showing an empty hangar.

Finished in 0.01993 seconds (files took 0.19066 seconds to load)
14 examples, 0 failures
COVERAGE: 100.00% -- 109/109 lines in 7 files.
10 files inspected, no offenses detected
These were my final results for test coverage.

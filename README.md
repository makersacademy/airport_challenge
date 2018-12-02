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

My approach to this challenge
---------
* Use user stories to build file structure and think about how I want them to interact with one another
* Build a test for a method I want, let it fail, then write the code and rework until it passes - using the TDD process learned in week 1 at Makers Academy
* Three items were present in the user stories - Airports, Planes, and Weather
* Used the user stories info to build these classes, for example the weather was stormy or not, the airport had a given capacity & could be full or empty
* Ran feature tests every step along the way to make sure the code was doing what I wanted it to be doing, and the tests weren't just passing by accident
* Used effective debugging methods as I had been taught to this week when I found myself blocked and my tests failing
* Effectively used the given tests to gain 0 rubocop infractions & 99% test coverage
* Were I to continue with this I would try to refactor it & reach 100% test coverage

![Imgur](https://i.imgur.com/RD5Fxio.png)

An example of how the program can be run in irb
---------

```
Simons-MBP:airport_challenge simon$ irb
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007f8a768dacb8 @planes=[], @capacity=9001>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007f8a768d2e28 @status="In Air">
2.5.0 :004 > plane.status
 => "In Air"
2.5.0 :005 > @planes
 => nil
2.5.0 :006 > airport.landing_plane(plane)
 => [#<Plane:0x00007f8a768d2e28 @status="Landed">]
2.5.0 :007 > plane.status
 => "Landed"
2.5.0 :008 > airport.landing_plane(plane)
Traceback (most recent call last):
        3: from /Users/simon/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /Users/simon/Projects/airport_challenge/lib/airport.rb:14:in `landing_plane'
RuntimeError (Unable to land)
2.5.0 :009 > weather = Weather.new
 => #<Weather:0x00007f8a77828d78>
2.5.0 :010 > weather.stormy
 => true
2.5.0 :011 > airport.take_off(plane)
Traceback (most recent call last):
        3: from /Users/simon/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):17
        1: from /Users/simon/Projects/airport_challenge/lib/airport.rb:21:in `take_off'
RuntimeError (Unable to take off)
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

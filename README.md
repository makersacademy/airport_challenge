Airport Challenge
=================

```
         .----.                                                  .'.
        |  /   '                                                 |  '
        |  |    '                                                '  :
        |334916  '             .-~~~-.               .-~-.        \ |
        |  |      '          .\\   .//'._+_________.'.'  /_________\|
        |  |___ ...'.__..--~~ .\\__//_.-     . . .' .'  /      :  |  `.
        |.-"  .'  /                          . .' .'   /.      :_.|__.'
       <    .'___/                           .' .'    /|.      : .'|\
        ~~--..                             .' .'     /_|.      : | | \
  JRO     /_.' ~~--..__             .----.'_.'      /. . . . . . | |  |
                      ~~--.._______'.__.'  .'      /____________.' :  /
                               .'   .''.._'______.'                '-'
                               '---'

```

Approach
-------

The task is described below. In designing the airport system, I've used strict TDD - writing code only in order to
satisfy failing tests using the 'red - green - refactor' approach for each test. 

The overall approach was as follows:
1. Map out a basic sequence diagram showing the messages flowing from the feature request
1. Design a basic airport that could land and takeoff planes
1. Add awareness to the Plane class about its status to prevent edge cases
1. Add instructions between airport and plane
1. Add a Weather class to generate different weather states
1. Inject the Weather class into the Airport class
1. Make the airport aware of the weather state
1. Replace uses of Strings with references to a defined constant re DRY principle
1. Replace static strings that are passed between objects, such as weather states, with symbols
1. Refactor to remove most weather methods from Airport's public interface
    1. Replace a specific check for 'stormy' with a general 'safe_weather?' method that's publicly available
    1. This allows the implementation of what constitutes safe weather to change without breaking any external dependencies
    1. e.g. it allows for an 'icy' condition to also constititute adverse weather
1. Refactor to substitute doubles for hard dependencies in the unit tests
1. Use stubs to add functionality to doubles and control for the random weather where needed
1. Refactor to remove any doubles present in feature tests
1. Add extra edge case tests where relevant
1. Final check to ensure each method has a single responsibillity
1. Refactor some public methods to move implementation detail into private methods

Key learning points
-------------------

- More experience with string TDD development and RSpec syntax
- Extensive use of doubles and stubs in unit tests to reduce dependencies
- Automated feature tests to ensure customer requirements are met
- Stubbing the random method to generate consistent weather for tests

Instructions
------------
Load the files into irb
```
2.5.0 :001 > require './lib/airport.rb'
 => true 
2.5.0 :002 > require './lib/plane.rb'
 => true 
```
Create an airport and plane objects
```
2.5.0 :004 > heathrow = Airport.new
 => #<Airport:0x000055e83dc27ab0 @capacity=20, @planes=[], @weather_generator=#<Weather:0x000055e83dc27a60>> 
2.5.0 :005 > plane1 = Plane.new
 => #<Plane:0x000055e83dc1e7f8 @landed=false> 
2.5.0 :006 > plane2 = Plane.new
 => #<Plane:0x000055e83dc1a388 @landed=false> 
```
Planes can land singly
```
2.5.0 :007 > heathrow.land(plane1)
 => [#<Plane:0x000055e83dc1e7f8 @landed=true>] 
```
ATC will prevent takeoffs or landings in stormy weather
```
2.5.0 :009 > heathrow.land(plane2)
Traceback (most recent call last):
        3: from /usr/share/rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /home/colin/Documents/Ruby/airport_challenge/lib/airport.rb:22:in `land'
RuntimeError (Unable to land: stormy weather)
```
And planes can take off again when the weather is clear
```
2.5.0 :010 > heathrow.takeoff(plane1)
 => #<Plane:0x000055e83dc1e7f8 @landed=false> 
```
And the airport is emptied again
```
2.5.0 :012 > heathrow
 => #<Airport:0x000055e83dc27ab0 @capacity=20, @planes=[], @weather_generator=#<Weather:0x000055e83dc27a60>> 
```

Acknowledgements
----------------

Many thanks to [Nikhil](https://github.com/nkhil) for being a great sounding board!

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

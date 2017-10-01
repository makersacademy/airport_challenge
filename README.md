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

My Approach
---------

I tackled this problem by breaking it down into the simplest possible
steps. I began by using irb to conduct feature tests, wrote unit tests
using RSpec that would prove my code once it was written. I strived to
implement a test driven approach throughout the entire process leading to
my code test coverage being 100%.

There were a few parts I struggled with: Effectively using
attr_reader/writers, making sure my RSpec tests were DRY and refactoring
once my code was working. But I have managed to implement all features
outlined in the user stories.

I have not been enable to figure out how to write an RSpec Feature test. To
add this bonus feature I'd need to conduct some more research into how to
do this.

Instructions
---------

```
11:49 $ irb
2.4.2 :001 > require './lib/airport'
 => true
2.4.2 :002 > airport = Airport.new
 => #<Airport:0x00007fcba49ad220 @planes=[], @capacity=20, @weather=#<Weather:0x00007fcba49ad1f8>>
2.4.2 :003 > plane = Plane.new
 => #<Plane:0x00007fcba49a5660 @landed=false>
2.4.2 :004 > airport.land(plane)
 => #<Plane:0x00007fcba49a5660 @landed=true>
2.4.2 :005 > airport.planes
 => [#<Plane:0x00007fcba49a5660 @landed=true>]
2.4.2 :006 >

```

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

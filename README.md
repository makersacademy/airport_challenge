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

----------------------
UPDATE BY PAUL KENRICK
----------------------

Summary
-----

This is software to control the flow of planes at an airport. The planes can land and take off provided that the weather is not stormy, and takes into account the capacity of the airport (which can be set by the user). 

My program includes the following classes:

- Airport
- Plane
- Weather

I have created Rspec tests to test functionality of methods within these classes, using stubs to isolate specific methods.  

Classes interact in the following way:

Plane <-----> Airport <-----> Weather

My code defends against the following edge cases:

- A plane landing more than once
- A plane taking off more than once
- A plane being asked to take off from an airport other than the airport where it has landed
- A capacity being set below zero

A basic irb based example below shows how the user would interface with this program to create the required airport and plane objects, land a plane at the airport, set the capacity of the airport from 5 (default) to 10 planes, and then instruct that same plane take-off from that airport:

-------------
irb(main):001:0> require './lib/airport.rb'

=> true

irb(main):002:0> require './lib/plane.rb'

=> true

irb(main):003:0> require './lib/weather.rb'

=> false

irb(main):007:0> airport = Airport.new

=> #<Airport:0x007fe508886b08 @capacity=5, @planes=[], @weather=#<Weather:0x007fe508886a18 @weather_array=["Fine", "Overcast", "Light Rain", "Breezey", "Stormy"]>>

irb(main):008:0> plane = Plane.new

=> #<Plane:0x007fe508876258 @on_ground=false, @location=nil>

irb(main):009:0> plane.land(airport)

=> "Plane landed at #<Airport:0x007fe508886b08>."

irb(main):010:0> airport.set_capacity(10)

=> 10

irb(main):012:0> plane.take_off(airport)

=> "Unable to take off. Message from airport: Weather too stormy"

irb(main):013:0> plane.take_off(airport)

=> "Plane took off from #<Airport:0x007fe508886b08>."

irb(main):014:0> airport.planes

=> []
-------------








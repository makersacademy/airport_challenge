
### Project
A software to control the flow of planes at an airport.

### Programming language
Ruby

### Development methods
TDD

#### User story 1
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

Domain model

Objects            | Messages
Traffic controller | instruct
Plane              | land
Airport            |

Diagram
Plane <-- land --> an Airport

Feature test
1. I want to be able to create a plane
plane = Plane.new

irb error
2.6.3 :001 > plane = Plane.new
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Plane)

RED
I will write an unit test that replicates the error
GREEN
Write minimum amount of code to pass the test
Refactor
Nothing to refactor yet

2. I want to be able to instruct the plane to land to a certain airport
plane = Plane.new
plan.land

irb error
2.6.3 :003 > require './lib/plane.rb'
 => true
 2.6.3 :006 > my_plane = Plane.new
 => #<Plane:0x00007fcfa211b718>
2.6.3 :007 > my_plane.land
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):7
NoMethodError (undefined method `land' for #<Plane:0x00007fcfa211b718>)

RED
I will write an unit test that replicates the error
GREEN
Write minimum amount of code to pass the test
Refactor
Nothing to refactor yet

3. I want plane to land to a given airport
plane = Plane.new
plane.land(airport)

irb error
2.6.3 :002 > require './lib/plane.rb'
 => true
2.6.3 :003 > plane = Plane.new
 => #<Plane:0x00007fa4de8299e0>
2.6.3 :004 > plane.land(airport)
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NameError (undefined local variable or method `airport' for main:Object)

RED
I will update an existing unit test to include this new feature
GREEN
Write minimum amount of code to pass the test
Refactor
Nothing to refactor yet

#### User story 2

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Domain model

Objects            | Messages
Traffic controller |
Plane              | take off
Airport            | confirm plane is not there any more

Diagram
Plane <-- take off --> Airport
Airport <-- confirm not longer there --> Plane

Feature test
1. First, I want to be able to instruct the plane to take off from an airport
plane = Plane.new
plane.take_off(airport)

irb error
2.6.3 :001 > require './lib/plane.rb'
 => true
2.6.3 :002 > plane = Plane.new
 => #<Plane:0x00007fa5a6877fa0>
2.6.3 :003 > plane.take_off(airport)
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NameError (undefined local variable or method `airport' for main:Object)
2.6.3 :004 >

RED
I will write a unit test to replicate the error
GREEN
Write minimum amount of code to pass the test
Refactor
Nothing to refactor yet

2. When I tested in irb my code so far, I received an error
NameError (undefined local variable or method `airport' for main:Object)
2.6.3 :004 > plane = Plane.new
 => #<Plane:0x00007ffe370f8240>
2.6.3 :005 > airport = Airport.mew
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):5
NameError (uninitialized constant Airport)

Realised he doesn't know where to take the airport from. So I decide to create a separate spec for airport and test if it creates an airport

RED
I will write a unit test to replicate the error
GREEN
Write minimum amount of code to pass the test
Refactor
Nothing to refactor yet

3. I want the airport to confirm that plane is not there any more
plane = Plane.new
airport = Airport.new
plane.take_off(airport)
airport.plane_gone?

irb error
2.6.3 :009 > plane = Plane.new
 => #<Plane:0x00007ffdc0088e30>
2.6.3 :010 > airport = Airport.new
 => #<Airport:0x00007ffdbd834010>
2.6.3 :011 > plane.take_off(airport)
 => nil
2.6.3 :012 > airport.plane_gone?
Traceback (most recent call last):
        4: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/carmen-alinacraciun/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):12
NoMethodError (undefined method `plane_gone?' for #<Airport:0x00007ffdbd834010>)
2.6.3 :013 >

RED
I will write a unit test to replicate the error
GREEN
Created the method  and set a default value of true
Refactor
Nothing to refactor yet

Realised that I thought the problem the other way around. I swap functionalities and tests between classes.

4. I want airport to store the landed plane. Currently when plane is landed value is nil.








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
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

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

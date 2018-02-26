Airport Challenge
=================

Forked from Makers Academy (source : https://github.com/makersacademy/airport_challenge)

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


**DOMAIN MODEL FROM USER STORY**

* class Airport (methods: inititalize, intruct_land, instruct_takeoff, weather)

* class Plane (methods: initialize, land, takeoff, attr_accessor :plane_status, :instruct)

* DEFAULT_CAPACITY constant set to 100 but can be passed as parameter in initialize of Airport.new

* Weather generator works by randomly selecting a number between 1-10 inclusive and it will change the weather to stormy if the number is 9 or 10 otherwise the weather will be sunny (meaning planes can takeoff and land). Weather is set to create a 20% chance of being stormy (in which case planes can not land or takeoff)

**NOTES**

* Program matches planes to airports at the point where the airport sends an instruction to the plane. There is no un-instruct method at the moment.

* Planes can not land if already landed / takeoff if they are in flight

* Planes can not land in airports where they were not instructed to land / takeoff from where they were not instructed to takeoff (or takeoff from airports they are not located in)

* TO DO: create method stubs (use of doubles) to simulate weather in testing

* TO DO: decrease class dependencies by passing new instances through arguments


**FEATURE TEST EXAMPLE USING IRB**

> require './lib/airport'
 => true

> london = Airport.new
 => #<Airport:0x00007fc733982e78 @capacity=100, @landed_planes=[], @current_weather=0>

> lisbon = Airport.new
 => #<Airport:0x00007fc733959c80 @capacity=100, @landed_planes=[], @current_weather=0>

> british_air = Plane.new
 => #<Plane:0x00007fc73589d3a8 @plane_status=["in-flight"], @instruct="none">

> tap_air = Plane.new
 => #<Plane:0x00007fc73587fab0 @plane_status=["in-flight"], @instruct="none">

> london.instruct_land(tap_air)
 => ["in-flight", #<Airport:0x00007fc733982e78 @capacity=100, @landed_planes=[], @current_weather=0>]

> lisbon.instruct_land(british_air)
 => ["in-flight", #<Airport:0x00007fc733959c80 @capacity=100, @landed_planes=[], @current_weather=0>]

> tap_air.land(london)
 => [#<Plane:0x00007fc73587fab0 @plane_status=["landed", #<Airport:0x00007fc733982e78 @capacity=100, @landed_planes=[...], @current_weather=0>], @instruct="none">]

> british_air.land(lisbon)
 => [#<Plane:0x00007fc73589d3a8 @plane_status=["landed", #<Airport:0x00007fc733959c80 @capacity=100, @landed_planes=[...], @current_weather=0>], @instruct="none">]

> london.instruct_takeoff(tap_air)
 => "takeoff"

> lisbon.instruct_takeoff(british_air)
 => "takeoff"

> tap_air.takeoff(london)
Traceback (most recent call last):
        3: from /Users/danielcampos/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):12
        1: from /Users/danielcampos/Projects/weekend_challenges/airport_challenge/lib/plane.rb:53:in `takeoff'
RuntimeError (Too stormy to takeoff)

> tap_air.takeoff(london)
 => []

> british_air.takeoff(lisbon)
Traceback (most recent call last):
        3: from /Users/danielcampos/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):14
        1: from /Users/danielcampos/Projects/weekend_challenges/airport_challenge/lib/plane.rb:53:in `takeoff'
RuntimeError (Too stormy to takeoff)

> british_air.takeoff(lisbon)
 => []

> tap_air
 => #<Plane:0x00007fc73587fab0 @plane_status=["in-flight"], @instruct="none">

> british_air
 => #<Plane:0x00007fc73589d3a8 @plane_status=["in-flight"], @instruct="none">

 **RUBOCOP ERRORS TO FIX**

 Offenses:

1. lib/plane.rb:18:3: C: Metrics/AbcSize: Assignment Branch Condition size for land is too high. [17.49/15]
  def land(airport) ...
  ^^^^^^^^^^^^^^^^^
2. lib/plane.rb:18:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def land(airport) ...
  ^^^^^^^^^^^^^^^^^
3. lib/plane.rb:20:5: C: Style/GuardClause: Use a guard clause instead of wrapping the code inside a conditional expression.
    if @instruct == "land" && @plane_status == ["in-flight", airport]
    ^^
4. lib/plane.rb:22:81: C: Metrics/LineLength: Line is too long. [88/80]
      raise 'No capacity in airport' if airport.landed_planes.length >= airport.capacity
                                                                                ^^^^^^^^
5. lib/plane.rb:42:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def takeoff(airport) ...
  ^^^^^^^^^^^^^^^^^^^^
6. lib/plane.rb:44:5: C: Style/GuardClause: Use a guard clause instead of wrapping the code inside a conditional expression.
    if @instruct == "takeoff" && @plane_status == ["landed", airport]
    ^^
7. lib/airport.rb:32:81: C: Metrics/LineLength: Line is too long. [82/80]
    raise 'Plane is not in this airport' if plane.plane_status != ["landed", self]
                                                                                ^^
7 files inspected, 7 offenses detected

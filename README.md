Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__  #Jan2019Crew   )
                `---~~\___________/------------`````
                =  ===(_________)

```

Implementation
---------
The Airport Challenge, as implemented here, will accept:

[your_airport_name] = Airport.new(optional_integer_for_capacity)
e.g.:
```
kai@~/Makers/week1/airport_challenge$ irb -r './lib/airport'
2.5.0 :001 > airport = Airport.new
 => #<Airport:0x00007ffed8890a10 @planes_in_airport=[], @capacity=10, @stormy=true>
2.5.0 :002 > larger_airport = Airport.new(100)
 => #<Airport:0x00007ffed888df18 @planes_in_airport=[], @capacity=100, @stormy=false>
2.5.0 :003 >
```
[plane_name] = Plane.new
e.g.:
```
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007f996d8f4ae0>
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007f996d8e78e0 @planes_in_airport=[], @capacity=10, @stormy=false>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007f996d8f4ae0>]
2.5.0 :005 > airport
 => #<Airport:0x00007f996d8e78e0 @planes_in_airport=[#<Plane:0x00007f996d8f4ae0>], @capacity=10, @stormy=false>
2.5.0 :006 >
 ```
airport_name.land(plane_name)
e.g.:
```2.5.0 :008 > airport_to_land_to.land(plane)
 => [#<Plane:0x00007ffed88863a8>]
 ```

airport_name.take_off(plane_name)
e.g.:
```2.5.0 :012 > stansted.land(makers_airways_123)
 => [#<Plane:0x00007ffeda018020>]
2.5.0 :013 > stansted.take_off(makers_airways_123)
Confirming #<Plane:0x00007ffeda018020> has taken off.
 => nil
2.5.0 :014 >
```
If the plane you are trying to land is not in the air, it will give an error:
```
2.5.0 :017 > stansted.land(makers_airways_123)
Traceback (most recent call last):
        3: from /Users/kai/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):17
        1: from /Users/kai/Makers/week1/airport_challenge/lib/airport.rb:20:in `land'
RuntimeError (Plane already landed!)
2.5.0 :018 >
```

If the plane you are trying to take off is either not in the airport you have specified or already in the air, it will give an error:
```2.5.0 :015 > stansted.take_off(plane)
Traceback (most recent call last):
        3: from /Users/kai/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):15
        1: from /Users/kai/Makers/week1/airport_challenge/lib/airport.rb:30:in `take_off'
RuntimeError (Plane not in airport!)
2.5.0 :016 >
```
If the airport is full to capacity, the program will not allow an additional plane to land:
```
2.5.0 :027 > small_airport = Airport.new(1)
 => #<Airport:0x00007ffed8193aa0 @planes_in_airport=[], @capacity=1, @stormy=false>
2.5.0 :028 > small_airport.land(plane1)
 => [#<Plane:0x00007ffed888d270>]
2.5.0 :029 > small_airport.land(plane2)
Traceback (most recent call last):
        3: from /Users/kai/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):29
        1: from /Users/kai/Makers/week1/airport_challenge/lib/airport.rb:22:in `land'
RuntimeError (Airport is full!)
2.5.0 :030 >
```

Weather is implemented so that 3 out of 5 instances the weather is sunny, allowing planes to land and take off. If the weather is stormy (2/5 probability) the program will throw a weather-related error if you try to do one of the available operations:
```
2.5.0 :030 > airport
 => #<Airport:0x00007ffed8890a10 @planes_in_airport=[], @capacity=10, @stormy=true>
2.5.0 :031 > plane
 => #<Plane:0x00007ffed88863a8>
2.5.0 :032 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/kai/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):32
        1: from /Users/kai/Makers/week1/airport_challenge/lib/airport.rb:24:in `land'
RuntimeError (Stormy weather, plane cannot land)
2.5.0 :033 >
```
Context and Design Considerations
---------
* Airports start out empty and weather is generated per airport instance created.
* Planes start out not landed at any given airport. I recognise this is not the most realistic scenario, but it
* Airport capacity is editable both at airport creation and by re-assigning the capacity variable.
* Weather is described as "mostly sunny". I made the decision to make the probability of stormy weather 2/5 in lib/weather.rb .
* The program checks the plane called to take off is currently held in the airport that is calling for the take_off method. This satisfies an edge case of a plane taking off from a different airport.
* Similarly, a plane has to be in the air to land at any given instance of an airport.
* To satisfy the requirement of 'confirming the plane is no longer in the airport', the take_off method reports the ID of the now-airborne plane in a printed message.

Key learnings
---------
* I tried to stick to strict Test Driven Development process during this project.
 - This meant working strictly in a Red - Green - Refactor cycle, writing out a feature test based on a design spec, followed by a unit test, then creating code that strictly satisfied said test. After the features were (more) fully implemented, the tests were refactored and occasionally removed entirely as they had been superseded by more complex and relevant tests.
 - RSpec syntax is becoming more approachable, where through this process I found my tests failing less due to poor syntax but rather the test contents not having corresponding production code.
 * Working toward single responsibility for each method and class.
 * To comply with the above, Module/class linking and injection into other classes.
 * Documenting an approach in advance before even thinking about tests is definitely useful to map out a general sense of what I want the program to do.
 * Rubocop is a harsh master.

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

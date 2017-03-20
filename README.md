Airport Challenge
=================
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

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




Software created with Ruby.

Allows Air Traffic Controllers to manage the takeoff and landing of planes to and from airports. Weather is variable, and planes cannot land at or take off from airports which are stormy. By checking for updates on the weather, a controller can determine when it is safe for a plane to land.

Example case
------------

2.2.3 :001 > require './docs/airport.rb'
 => true
2.2.3 :002 > boeing = Plane.new "Boeing 747"
 => #<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=true>
2.2.3 :003 > heathrow = Airport.new "Heathrow"
 => #<Airport:0x007fe34b0a4138 @name="Heathrow", @hangar=[], @capacity=5, @weather=:stormy>
2.2.3 :004 > heathrow.land(boeing)
RuntimeError: Plane cannot land in stormy conditions
2.2.3 :005 > heathrow.check_weather
 => :clear
2.2.3 :006 > heathrow.land(boeing)
 => [#<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=false>]
2.2.3 :007 > heathrow.hangar
 => [#<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=false>]
 2.2.3 :008 > heathrow.check_weather
 => :stormy
 2.2.3 :009 > heathrow.take_off(boeing)
RuntimeError: Plane cannot take off in stormy conditions
2.2.3 :010 > heathrow.check_weather
 => :clear
2.2.3 :011 > heathrow.take_off(boeing)
 => true
2.2.3 :012> heathrow.hangar
 => []
2.2.3 :013 > boeing
 => #<Plane:0x007fe34b10ea60 @name="Boeing 747", @airborne=true>



Possible improvements
----------

Rewrite take_off function to return error for plane not being in hangar even if it is stormy.

Write test case to ensure a plane can land after check_weather returns clear weather.

Currently fails:

'''it 'expects a plane to land if the weather clears' do
  allow(airport).to receive(:weather).and_return(:stormy)
  allow(airport).to receive(:check_weather).and_return(:weather => :clear)
  expect(airport.land(airbus)).not_to raise_error('Cannot land plane: condition is stormy. Check weather for update')
end
'''

Error:

'''Failures:

  1) Airport expects a plane to land if the weather clears
     Failure/Error: airport.land(airbus).stormy? == false
     RuntimeError:
       Cannot land plane: condition is stormy. Check weather for update
     # ./docs/airport.rb:16:in `land'
     # ./spec/airport_spec.rb:60:in `block (2 levels) in <top (required)>'
     '''


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

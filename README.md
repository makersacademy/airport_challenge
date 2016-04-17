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

Introduction
---------
This program simulates an air traffic control system that allows planes land and take off at an airport under certain weather conditions.


Features
-------
* [ ] Plane status
* [ ] Plane landing
* [ ] Plane takeoff
* [ ] Storms prevent landing
* [ ] Storms prevent takeoff
* [ ] Full airport cannot land planes
* [ ] Variable and default capacity
* [ ] Errors raised for inconsistent actions

Instructions
-----

Clone this repo:

`$ git clone git@github.com:sitypop/airport_challenge.git`

Change to airport_challenge directory, open irb and require the airport.rb file:

```
$ cd airport_challenge
$ irb
2.2.3 :001 > require "./lib/airport.rb"
 => true
 ```

Now we can build airports:

 ```
 2.2.3 :002 > gatwick = Airport.new(20)
 => #<Airport:0x007fe94b8e70d8 @capacity=20, @planes=[], @weather=#<Weather:0x007fe94b8e7088>>
2.2.3 :003 > heathrow = Airport.new(10)
 => #<Airport:0x007fe94b8d67b0 @capacity=10, @planes=[], @weather=#<Weather:0x007fe94b8d6738>>
  ```

And planes:

```
2.2.3 :004 > easyjet = Plane.new
 => #<Plane:0x007fe94b8c71c0 @landed_status=false>
2.2.3 :005 > ryanair = Plane.new
 => #<Plane:0x007fe94b8b5790 @landed_status=false>
 ```

 Let's land the planes now:

```
 2.2.3 :006 > gatwick.land(easyjet)
 => [#<Plane:0x007fe94b8c71c0 @landed_status=true>]
 2.2.3 :007 > heathrow.land(ryanair)
RuntimeError: Too stormy to land
	from /Users/sity/Desktop/Week_5_Projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):8
	from /Users/sity/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
Oops, it looks like it is too stormy to land in Heathrow today! Typical.

Now let's take off, and go somewhere exotic please.

```
2.2.3 :009 > gatwick.take_off(easyjet)
 => #<Plane:0x007fe94b8c71c0 @landed_status=false>
 ```

I have considered edge cases to ensure the consistency of the air control system so don't try to take off a plane if it is already flying. Duh. 👆

 Author
 -----

 Sity Shah


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

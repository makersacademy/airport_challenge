Anthony's Airport Challenge
=================
[Readme adapted from here](https://github.com/makersacademy/airport_challenge)

```
        ______
        _\____\___
=  = ==(___AO_MA__)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Introduction
-------

My solution to the Makers Academy Week 1 Airport Challenge.

Task
-----

`irb`
`require './docs/airport.rb'`

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

* Creating the objects
`airport = Airport.new`
`plane = Plane.new`
* Plane can be landed with 
`airport.land(plane)`
* You can further check the plane now exists at the airport with
`airport.plane`

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

* Plane can be instructed to take off with
`airport.takeoff(plane)`
* To confirm the plane is no longer at the airport
`airport.hangar` 

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

`plane2 = Plane.new`
`small_airport = Airport.new(1)`
* Attempting to land both planes will result in an error "Hangar is full"
`small_airport.land(plane1)`
`small_airport.land(plane2)`
----->> ` Airport is full (RuntimeError)`

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

* Shown above with creation of `small_airport` demonstrating overriden defaul, adding 20 planes to `airport` will result in error (as default is set to 20 and `plane1` is currently in `airport`)
`20.times { airport.land(Plane.new) }`
----->> `Airport is full (RuntimeError)`

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

* Weather has arbitrarily been assigned a value between 1 and 10, with weather > 8 being "stormy", weather <= 8 being "clear and sunny"
* Constant WEATHER_CUTOFF used to represent this value, 8
* On creation of the airport, weather value is set to 1 (sunny)
* In order to change the weather, call
`airport.check_weather`
* This will generate a random number between 1 and 10 and assign the weather accordingly.
* If the weather `is stormy.`, doing the following
`airport.land(plane1)`
or `airport.takeoff(plane1)` 
----->> `Cannot land: stormy weather (RuntimeError)` or 
`Cannot takeoff: stormy weather (RuntimeError)`

What I have learned during this project
-----
* Using irb to design a feature test
* Using the irb feature test as a template for the RSPEC unit test
* Only writing code to pass the unit tests (TDD Discipline)
* Using RSPEC to ba able to test scenarios with built in randomness by using a stub
* Writing a comprehensive readme

[Edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) covered:
-----

* Raises an exception when the same plane tries to land twice
* Raises an exception when the same plane tries to take off whilst already in the air
* Raises an exception if a plane is asked to takeoff from the wrong hangar

Features
-----
* All tests pass (14 examples, 0 failures)
* [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md): COVERAGE: 100.00% -- 130/130 lines in 4 files

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

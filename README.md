Airport Challenge
=================

**Julian's README Content**
From the user stories and instructions, the following have been created to enable the program to work:
*Classes*
1. Airport - the principal class responsible for running the program
2. Plane - used for assigning and amending statuses to plane objects ("landed" or "airborne")
3. Weather - used for generating weather states ("sunny" or "stormy")
4. Modules - used for storing constants

*Airport Methods*
0. Initialize - creates a new Airport object which contains an array `@ramps`, where planes land in.
* `airport_full` (optional argument) - pre-populates airport ramps with Plane objects if "full" (default).
* `airport_capacity` (optional argument) - sets capacity of airport; default to the constant AIR_CAP.

1. land_plane - lands a plane in the `@ramps` array. Several guard conditions must be passed to run the code. If the plane can land, the `@plane_status` attribute is set to "landed".
* `plane` (mandatory argument) - the Plane object to land
* `idx` (mandatory argument) - the index location of `@ramp` to land plane at.
* `weather` (optional argument) - by default uses the `check_weather` method to randomly generate the weather state.

2. take_off - flies a plane out of the Airport `@ramps` array.  Several guard conditions must be passed to run the code. If the plane can take off, the `@plane_status` attribute is set to "airborne".
* `idx` (mandatory argument) - index location of `@ramps` for the plane you want to fly.
* `weather` (optional argument) - by default uses the `check_weather` method to randomly generate the weather state.

3. airport_full? - checks the `@ramps` array to determine `@airport_status` attribute value ("full" or "not full").

4. check_weather - creates a new Weather object and determine the `@weather_report` attribute value ("sunny" or "stormy").

*Plane Methods*
0. Initialize - creates a new Plane object. By default, its `@plane_status` attribute is set to "airborne".
`plane_ref` (optional argument) - a custom reference for the plane; easier than reading object IDs.
1. landed - sets `@plane_status` attribute to "landed"
2. airborne - sets `@plane_status` attribute to "airborne"

*Weather Methods*
0. Initialize - creates a new Weather object and returns a randomly generated state of "sunny" or "stormy". 10% chance of getting "stormy".

*Modules*
0. CAPACITY - stores the airport capacity constant, AIR_CAP (set to 10)

*Instructions*
1. To run the program, you first need to generate a new airport object
  * airport = Airport.new()
2. Either create a plane object or have one take off from one of the airport `@ramps`
  * `plane1 = Plane.new`
  * `plane2 = airport.take_off(0)`
3. To land a plane, select an empty index location in `@ramps` (these will be `nil` objects)
  * `airport.land_plane(plane1, 0)`
4. If landing or taking off is not possible, you will get an error message. The following will stop landing / take off:
  * Weather is stormy
  * Non-existent ramp selected
  * Airport is full (landing only)
  * Ramp is not empty (i.e. occupied by another plane) (landing only)
  * Plane is already landed (landing only)
  * No plane at the ramp (take off only)
  * Plane is already airborne (take off only)


**Original README Content**
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

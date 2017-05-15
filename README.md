Airport Challenge
=================

To test - navigate to project folder, run rspec OR run irb and require './lib/plane'

Solution
---------
My solution is a simple model with two classes - Airport and Plane

It should allow planes to land at, and depart from an airport. The status of the plane is checked on take off and landing to make sure we are not trying to land a plane which has already landed, or take off when we are already flying. Airports have a capacity and weather, which are also checked at take off and landing.

Multiple airports can be initialized which each have their own names, capacities and weather. Each airport will keep track of the planes which are landed there.

The variables and methods which make up each class are as follows:

* Airport
  * Instance variables
    * airport_name -> holds name of the airport for printing
    * capacity -> holds the maximum number of planes which can land at an airport. Defaults to the DEFAULT_CAPACITY constant
    * weather -> holds the current weather conditions. Defaults to "calm"
    * planes -> an array of all planes landed at the airport
  * Constants
    * DEFAULT_CAPACITY -> holds the number 10 as the default number of planes any airport can have landed
  * Methods
    * attr_reader -> for each of the instance variables
    * initialize
    * storm_switch -> if the 'weather' instance variable is 'storm' it will be set to 'calm', otherwise it will be set to 'storm'
    * weather_change -> 1 time in 3 it will invoke the storm_switch methods
* Plane
  * Instance variables
    * flying -> records if the plane is currently 'flying' or 'landed'
  * methods
    * attr_reader -> for 'flying' instance variables
    * initialize
    * land_at(airport) -> lands the plane at the given airport
    * land_guard_conditions(airport) -> performs landing checks
    * depart_from(airport) -> has the plane take off from the given airport
    * depart_guard_conditions(airport) -> performs departure checks
    * flying_switch -> changes the 'flying' instance variable between 'flying' and 'landed'
    * flight_path(airport1, airport2) -> plane takes off from airport 1 and lands at airport2. If it can't land at airport2 it returns to airport1


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

Reviewers will potentially be using this [code review rubric](docs/reROlandview.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

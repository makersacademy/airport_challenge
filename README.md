Airport Challenge (updates below the task description)
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

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

ANALYSED user stories for nouns and verbs
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
verbs = get, instruct, land
nouns = passengers, destination, plane, airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
verbs = get, instruct, take off, confirm
nouns = passengers, plane, aiport, 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
verbs = ensure, prevent landing
nouns = safety, airport

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
verbs = used, overridden
nouns = software, airports, capacity.

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
verbs = ensure, prevent
nouns = takeoff, weather

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

verbs = ensure, prevent
nouns = landing, weather

Potential actions from analysis:
air traffic controller  
    instructlanding_at_airport
    instruct_takeoff_from_airport
    
    confirm_leftairport
    prevent_landing_when_airportfull
    prevent_landing_when_stormy
    prevent_takeoff_when_stormy
system designer  
    override_default_capacity

Note: requirement for weather to be emulated - potentially in tests first.
INPUTS


EDGE CASES - 
no planes in aiport
over capacity
instructs to land at a different airport
** assuming things like landing at right airport not controlled at this point.
that planes can only take off from airports they are in
planes that are already flying cannot take off and/or be in an airport;
planes that are landed cannot land again and must be in an airport, etc
may need additional variables such as inflight and landed to monitor this.

Classes Needed and PSEUDO code
Class Airport 
INPUTS
will need to define variables such as capacity and an array of planes with location
will need to assess if needed outside of class or not
METHODS
  instructlanding_at_airport
    call prevent landing when stormy then do not land if true, else land, set airport variable, , set landed/flying variable
  instruct_takeoff_from_airport
    check if stormy then do not take off. if takeoff, set airport variable, set  landed/flying variable
  #confirm_leftairport
    not required, as variable will be set to monitor this, e.g. flying / landed.
  prevent_landing_when_airportfull
    check if > capacity if plane lands and return message.
  prevent_landing_when_stormy - return true if stormy.
  prevent_takeoff_when_stormy - return true if stormy ** potential to merge with above method for landing
  instruct landing **not sure required. parking
OUTPUTS updated capacity, inflight (True / False), airportat

Class Weather *potentially if implemented, and not just done through testing at this stage.
  INPUTS number from 1-10, or default uses the rand(10) generation
  ##not, if not using doubles in rspec, this could take an input argument
  weather_is_stormy
    Returns stormy rarely, and OK otherwise. Potential to use rand(10) to generate this where 10 is Stormy. Return True if stormy
  OUTPUT TRUE / FALSE

  Realised about half way through that struggled to control the plane information in an array, so created a Plane Class
  Plane Class
  Initialises last airport, assigned plane no, and status (flying, landed)
  It also returns this information on request, or the values can be directly updated.

  This brought some complexity in and i struggled to make the necessary changes to the rspec and code to make this operational. I believe that once i can get the airport class reading the people data consistently then i can make progress on finishing the task. It was the introduction of passing multiple variables that has hamstrung my progress in diagnosing the issue. Also should have regularly saved changes to show that all tests were working, so a lesson learnt going forwards.

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

*  What I tried to do
Firstly understand the User Stories:
As a < type of user>, I want < some goal >, so that < some reason >

OBJECTS                 |  MESSAGES
-------------------------------------
Air traffic controller  |
Plane                   | Edge case tests - is plane fying?                  
Airport                 | instruct plane to take off
                        | instruct plane to land
                        | Prevent landing when airport is full
                        | Prevent take off when airport is empty
                        | Take weather into account                        
Weather                 | fine or stormy

System designer
Airport                 | Default capacity

Create the following tests and then write the code to satisfy the failing conditions.
(Use IRB)

RSPEC tests for the Airport
1. Landing tests
   "Responds to landing with (1) argument:
   "Responds to landing a plane at the airport"
   "Prevents a plane landing when the airport is full"
2. Taking off
   "Confirm that a plane is no longer in the airport after take off - land 2 planes and take off 1"
   "Confirm that a plane is no longer in the airport after take off - land 1 plane and then take it off"
   "Prevents a plane taking off if the airport is empty"
3. Capacity Changes
   "Returns the DEFAULT capacity"
   "Allow DEFAULT capacity to be overwritten with 100"
4. Stormy weather
   "Prevent take off when the weather is stormy" 
   "Prevent landing when the weather is stormy"
5. Edge Cases
   "Expect plane to have a status of flying after take off"
   "Expect plane to have a status of NOT flying after landing"

RSPEC tests for the Plane
1. "Check whether a plane is in_ light" 
2. "Check whether a plane is not in flight"

RSPEC tests for the Weather
1. "Checks for bad weather" 
2. "Checks for fine weather" 

LASTLY REFACTOR the code and rerun the tests

Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 10am Monday morning

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

* Finally, please submit a pull request before Monday at 10am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 10am.

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

```
Step 1: attempt to create a new airport (Airport.new) from the command line.
Step 2: write corresponding Rspec test, which should also fail.
Step 3: pass that test by creating an airport class
Step 4: attempt to create a new plane (Plane.new) from command line.
Step 5: write corresponding Rspec text, which should also fail.
Step 6: pass that test by creating a plane class
Step 7: attempt to land the plane by calling .land on the airport plane I have created, passing the plane as the argument.
Step 8: write corresponding Rspec test, which should also fail.
Step 9: pass that test by creating a land method in the airport class.
Step 10: realised quite early into the project that it would be best to hold the planes in an array so refactored to allow the planes to sit inside the airport array.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Step 1: attempt to take off a plane from command line
Step 2: write corresponding Rspec test, which should also fail.
Step 3: pass that test by creating a takeoff method
Step 4: display the empty airport to the user.
Step 5: would like to display the planes in the airport in a more user-friendly way (i.e. not their memory assignment)

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
STORY 3 & 4:
Step 1: Added weather method which randomly (1/5 chance) chooses whether it is stormy or fine
Step 2: Call this method inside the takeoff and landing methods (making them private)
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
Step 1: Attempt to land a lot of planes from command line
Step 2: write corresponding Rspec test, which should check if the airport is full
Step 3: include a maximum limit to the airport array
Step 4: notify the user that the airport is full when attempting to land a plane in a full airport
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Step 1: Attempt to create a new instance of an airport, passing a number as an argument
Step 2: write a corresponding Rspec test which should fail
Step 3: implement adding a changeable default value for airport capacity


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

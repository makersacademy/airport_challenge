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

My approach to this challenge
-----------------------------

* Started early! Worked till 2am Friday night then started again the following morning and continued for the whole day. Then felt relaxed so I could enjoy Saturday night and Sunday daytime. Then back to it on Sunday night but felt relaxed about it. This was a good approach.
* Attempted to extract a domain model from the user stories (see docs.domain_model.md)
* Kept a track of the features I wanted to test (see same file) - I wrote over 20 but went through the whole RED - GREEN - REFACTOR cycle for each one before writing another. This approach was AMAZING for breaking the problem down into small solvable chunks.
* RED: Tested each feature in IRB, then replicated the failure as a unit test
* GREEN: Got the tests to pass using the simplest possible method
* REFACTOR: Refactored the code and the tests for optimum readability and simplicity
* After each feature (and sometimes more often) I pushed the changes to github
* Kept a close eye on the pull request to check for coverage, CI tests and style guide violations
* Discussed a few specific problems with Chet and Jen - I've credited them directly in the code for their contributions
* Re-factored the names, structure and flow of my tests to make it clear that the user story criteria had been met

Things I struggled with
-----------------------
* Initially, whether it should be airport.land(plane) or plane.land(airport) but my domain model pointed to the former (also it was the most similar to our docking_station model). I think this worked out well.
* Using a mock for the plane object where I had methods in airport.rb that changed the plane's flying status from true to false or vice versa. I tried many things but never solved this so ended up largely using real Plane objects which I know is not ideal. Felt quite frustrated about this as it doesn't feel like it should be a big thing to solve.
* Deciding if weather should be in its own class or not. I decided for ease that weather was a condition relating specifically to the airport, so I felt okay about putting a method inside that class. However in the real world, that's probably not how it should work.
* Figuring out what caused my test coverage to go down to 99.3% but Tadas told me I could click on it and that enabled me to identify which method was lacking tests and get it back to 100%

Refactoring opportunities / things I didn't get round to
--------------------------------------------------------
* Sort out my issue with mocks - use stubs instead of real Plane objects
* Create a separate Weather class
* Look into modules and mixins. I only got to chapter 21 of the previous exercise so haven't come across these yet
* Writing the feature spec
* Using Travis CI locally

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

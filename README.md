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

Challenge
---------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. See [Domainmodel.md](http://github.com/memunyawiri/airport_challenge) in file tree for supporting user stories.

*Task:* To test drive the creation of a set of classes/modules to satisfy all the user stories.

Steps
--------
1. Fork this repo, and clone to your local machine
2. Run the command ```gem install bundle``` (if you don't have bundle already)
3. When the installation completes, run ```bundle```
4. Complete the above task:

Methods used for special features in program
-----------------------------------------------

You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Extra software and Gems used
-----------------------------

* Simplecov
* Rspec Test Check tech (actual name)
*
*

How the software currently works/looks:
------------------------------------

(***irb or code example in bakcwards apostrophes goes here***)


**Notes On Submission**

*Tasks completed:*
Plane status - 45 minutes #(insert markup tick next to each completed)
Plane landing - 45 minutes
Plane takeoff - 45 minutes
Storms prevent landing - 45 minutes
Storms prevent takeoff - 45 minutes
Full airport cannot land planes - 60 minutes
Variable and default capacity - 60 minutes
Errors raised for inconsistent actions - 60 minutes

*Tasks remaining(with notes):*
Variable and default capacity - 60 minutes
Errors raised for inconsistent actions - 60 minutes

*Process references:*
* Rspec format [An intro to TDD - makersacademy video](https://www.youtube.com/watch?v=CHTep2zQVAc)


*Solution references*

Code review
------------
Submitted code reviewed against the following:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.
* Reviewed using this [code review rubric](docs/review.md).
* Code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
* For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

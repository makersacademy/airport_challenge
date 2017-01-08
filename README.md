Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__      

```
What is it?
-------------

We have a request from a client to write the software to control the flow of planes at an airport. 
The planes can land and take off provided that the weather is sunny. 
Occasionally it may be stormy, in which case no planes can land or take off.  



Task
-------------

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.


Solution
------------

1. Translate user stories into feature tests, separating Objects and Messages
2. Make diagram to see how these Objects and Messages interact with each other
3. Research the less familiar concepts like using a test double for testing random weather
4. Create feature and unit tests - TDD
5. Write classes and methods that follow SRP

Areas for improvement
----------------------

1. Write separate Plane and Airport class
2. Create separate Weather module
3. Include mixins in both the tests and code
4. Include more doubles, stubs for agile development purposes

Requirements
-------------

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

Installation
--------------
Please see Gemfile

Licensing
--------------

Please see the file called LICENSE.

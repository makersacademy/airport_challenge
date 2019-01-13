Airport Challenge
=================
```
                   |
                       --====|====--
                             |  

                         .-"""""-. 
                       .'_________'. 
                      /_/_|__|__|_\_\
                     ;'-._       _.-';
,--------------------|    `-. .-'    |--------------------,
 ``""--..__    ___   ;       '       ;   ___    __..--""``
           `"-// \\.._\             /_..// \\-"`
              \\_//    '._       _.'    \\_//
               `"`        ``---``        `"`

```

Installation
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Running automated tests
-------
This project uses `RSpec` to run automated tests. 

To run the automated tests, open the project root directory in your terminal and run `rspec`

Approach
-------
Please refer to Task below for context.

**TDD**

I've used strict TDD (red - green - refactor) throughout the process of solving this. Originally, all the unit tests were written while instantiating new objects (for eg: `plane = Plane.new`), but I recognised the downside here would be that my unit tests (for eg: land method on the Airport class) need to be tested in isolation, and should not depend on the `Plane` object as the purpose of unit tests is to be able to verify that particular method works (irrespective of dependencies). I have refactored all my unit tests to include doubles when dealing with external objects and methods. This required additional stubs however, but I feel more confident that my unit tests are robust (albeit slightly less readable). 

**Feature Tests**

Feature tests use newly instantiated objects to test the application as a whole, and is designed to test the system as a user would.

**Random Weather**

In the user stories, it seems like the weather is sunny most of the time, but sometimes there is a storm. I decided to create a new `Weather` class, and add a `stormy?` method to it which returns `true` or `false` randomly with 1:9 odds (i.e. it returns `true` 10% of the time).

Acknowledgments
-------
Many thanks to [Colin Hulme](https://github.com/ch359) for patiently explaining subbing, doubling and the importance of stubbing in unit tests.

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

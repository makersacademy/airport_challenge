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

Documented process in 'ma_process.md'
---------
* Full documentation of the steps taken to complete this project. Please read!!

**Things I can do to improve for future projects:**

Introduction
---------
This project is provided by Makers Academy. It is the first individual project given to students on completion of Week 1 of the course. It consolidates the skills taught during Week 1 in test-driven development and object-oriented programming.

The aim of this project is to write software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

The template for this this README file has been taken from [A Medium Corpo](https://medium.com/@meakaakka/a-beginners-guide-to-writing-a-kickass-readme-7ac01da88ab3).

Motivation
----------

The purpose of this project is to work of my weekly focus goals:

##I can TDD anything

Write a meaningful test. based on the user requirements. Write code using TDD to make the test pass.

##I can program fluently

Learn how to setup and structure a new Ruby project, and turn user requirements into working code.

##I can debug anything

Focus on specific techniques for uncovering the root-cause of bugs in your code.

##Specific goals

* Fully grasp the concept of TDD. Follow a clear structure and approach that can be applied to all projects.

* Develop understanding of RSpec functionality.

Build Status
---------

Complete:

* All user stories have been fulfilled and pass green.

Incomplete:

* Edge cases have not been tested.
* Bonus of writing RSpec feature that tests a number of planes landing and taking off has not been written.

Installation
---------

##1. Getting Started

* Enter the interactive terminal by typing `irb` from the root directory of the airport_challenge directory.
* Once in the `irb`, type the following dependencies:

`irb(main):001:0> require './lib/airport'
=> true
irb(main):002:0> require './lib/plane'
=> false
irb(main):003:0> require './lib/weather'`

This allows access to the folders from within `irb`. The next step is to create your aiport.

##2. Creating airports

Unfinished (for the time being!!)

Below are the instructions as provided by Makers Academy

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

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

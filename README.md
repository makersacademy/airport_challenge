# Airport Challenge
A weekend challenge set by Makers Academy to gage our understanding of test driven development. 

The instructions for the challenge can be found in the instructions section at the bottom of this page.

All user stories have been completed. The bonus task was not attempted. 

## Running the App

### Prerequisites

The following are required in order to run and test this solution to the challenge.
* Ruby 2.5.0
* RSpec gem
* Bundle gem

### Installation
Run the following commands to install the require prerequisist. 

Ruby 2.5.0:

```
$ rvm install "ruby-2.5.0"
```

RSpec:

```
$ gem install rspec
```

Bundle:

```
$ gem install bundle
```

## Testing

### Feature tests

All feature tests can be run using:

```
$ ruby feature_tests.rb
```

Individual feature tests can be run by running the individual test contained within the `feature_test` directory. For example:

```
$ ruby ./feature_tests/13_check_if_airport_full.rb
```

### Unit tests

Unit tests can be run using:

```
$ rspec
```

### Test coverage

All code has been written test-first.

Test coverage is at 100% as checked by `SimpleCov`.

Tests cover all user stories and edge cases such as planes taking off from airports that they are not in.

# Progress
## User Stories
- [x] User Story 1
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass
- [x] User Story 2
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass
- [x] User Story 3
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass
- [x] User Story 4
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass
- [x] User Story 5
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass
- [x] User Story 6
  - [x] Feature tests written
  - [x] Unit tests written
  - [x] All tests pass


## Consideration
A list of things to consider throughout the challenge:

- [x] Planes can land and take off provided that the weather is sunny
- [x] You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy)
- [x] Your code should defend against edge cases such as inconsistent states of the system
  - [x] Planes can only take off from airports they are in
  - [x] Planes that are already flying cannot takes off and/or be in an airport
  - [x] Planes that are landed cannot land again and must be in an airport
- [x] Override weather conditions using use test doubles
- [x] create a separate file for each:
  - [x] class
  - [x] test suite
- [x] In code review we'll be hoping to see:
  - [x] All tests passing
  - [x] High Test coverage (>95% is good)
  - [x] The code is elegant:
    - [x] Every class has a clear responsibility
    - [x] Methods are short
- [x] Refactor
- [x] README file

## contributors
* [makersacademy](https://github.com/makersacademy) - author of the challenge
* [Terence Mace](https://github.com/Tolvic) - author of the solution for the challenge




## Challenge Instructions
* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Steps
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

## Task
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

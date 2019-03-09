# Airport Challenge

[Getting started](#getting-started) | [Usage](#Usage) | [Running tests](#running-tests)

[Brief](#Brief) | [Approach](#Approach) | [Areas for improvement](#Areas-for-improvement)

This is one of the weekend challenges from the Makers Academy course.

It is a program that can be run in REPL to control the flow of planes in an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

[See here](https://github.com/makersacademy/airport_challenge) for Makers' original repo.

### Getting started

`git clone https://github.com/amyj0rdan/airport_challenge`     
`gem install bundle`     
`bundle`     

### Usage

Run in `irb`

### Running tests

`rspec`

-------
## Brief

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
**Bonus**

* Write an RSpec **feature** test that lands and takes off a number of planes

-------
## Approach

- Broke down each user story into nouns and corresponding verbs
- Derived suitable corresponding likely methods for feature testing
- Used TDD to build program, starting with `Airport` and `Plane` classes, then adding `Weather` classes when I reached that user story
- Refactored tests by context when introduced the `Weather` class

**User story 1**
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

1. `Airport` class

Tests:
- `land` method
- with 1 argument (`plane`)


2. `Plane` class

Tests:
- Only to check existence of `Plane` class

**User story 2**

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
1. `Airport` class

Tests:
- `take_off` method
- Be able to check if instance of a `Plane` is no longer held by that `Airport`
- Update `land` method to track planes that land so tracking both ways

**User stories 3 and 4**

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy


As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

1. `Weather` class

Tests:
- `forecast` method
- Be able to check if the `forecast` is 'Clear' or 'Stormy'


2. `Airport` class

Tests:
- `stormy?` method     
_(Originally tried a `weather` method but that resulted in more complicated syntax than just checking if the weather was stormy)_
- Use an instance of the `Weather` class to check if the weather is stormy
- Update `land` and `take_off` methods to raise an error if `stormy?`

**User story 5**

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

1. `Airport` class

Tests:
- `full?` method
- Create an attribute of `capacity` to check against
- Update `land` method to raise an error if `full?`

**User story 6**

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

1. `Airport` class

Tests:
- `DEFAULT_CAPACITY` exists
- Able to input a variable capacity at instatiation of an `Airport`

--------

## Areas for improvement

- `Weather` class, `forecast` method - not testing the randomness of the generator (only that it produces 'Stormy' or 'Clear')      
-- Possible to use a mock?
- `Weather` class, `forecast` method - rubocop requirements were for use of ternary method rather than an if/else statement     
-- Would prefer to use if/else statement
- `Airport` class, `stormy?` method - not testing the randomness of the generator (only that it produces 'true' or 'false')     
-- Possible to use a mock?
- Unsure how to use mocks in `before(:each)` statements (ie, in the context setups)     
-- Is it possible?     
- Haven't used doubles for `stormy?` so that other tests aren't disrupted by changes
- Haven't completed one of the requirements:
_Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc._

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
Table of Contents
-----
* [Task](#task)
* [Task Acceptance Criteria](#task-acceptance-criteria)
* [User Stories](#user-stories)
* [Installation](#installation)
* [How To Run Tests](#how-to-run-tests)
* [How To Use The Application](#how-to-use-the-application)
* [Built Using](#built-using)

Task
-----

The task for this challenge was to create an Airport application that utilised Object Oriented Programming (OOP) through a Test Driven Development (TDD) approach. The user stories below outline the requirements for this challenge - to allow planes to land and take off given the correct weather conditions are established, and in addition, to control air traffic by defining and managing airport capacity.

My approach to this challenge was to work through each individual user story, breaking each component down into the simplest requirement to create each class and method as needed, while applying the **RED, GREEN, REFACTOR** method in parallel. This method requires a test to be created initially to define what each element of the application should be doing, running the test to ensure they are failing in the intended way, then developing the feature using the test requirements. Once the feature is working correctly and the tests are passing, I then revisited my code to improve implementation and readability for better maintainability. As a personal focus, on the day of the Airport challenge, I had set myself the goal of learning more about RSpec's "syntactic sugar" to reduce lines of unnecessary code and improve readability, and in doing so, I have applied some examples of this in my tests. 

Task Acceptance Criteria
-----

* Create an airport application using OOP and TDD that follows the criteria set in the user stories
* Have all tests passing
* Have high [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

User Stories
-----

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
Installation
-----

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

How To Run Tests
-----

Once `bundle` has been ran, to test the application,

1. Open the application directory `/airport_challenge` using your preferred terminal 
2. Run `rspec` to see a list of tests and coverage reports.

In your terminal, you should see the below: 
```
Airport
  #initialize
    should initialize an empty array to store planes
    should set the default capacity to 30
    should allow the default capacity to be overridden
  #land
    is expected to respond to #land with 1 argument
    should allow a plane to land
    should prevent landing when airport is full
    should prevent landing when stormy
  #takeoff
    is expected to respond to #takeoff
    should allow a plane to take off
    should allow a plane to take off and report plane is not in the airport
    should prevent take off when stormy
  feature
    should land and take off multiple planes

Plane
  is expected to respond to #in_airport
  is expected to respond to #landed?
  can be reported as landed

Weather
  #stormy?
    is expected to respond to #stormy?
    should report true
    should report false

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.01763 seconds (files took 0.1141 seconds to load)
18 examples, 0 failures


COVERAGE: 100.00% -- 85/85 lines in 6 files
```
How To Use The Application
-----
Create an Airport
```
Airport.new => #<Airport:0x000000014a2a4090 @planes=[], @capacity=30>>
```
Create a Plane
```
Plane.new => #<Plane:0x000000014a29f310>
```
Create Weather
```
Weather.new => #<Weather:0x000000013f174cc0>
```
Land Plane
```
airport.land(plane) => #<Airport:0x000000014a2bc118 @planes=[#<Plane:0x000000014a2af698>], @capacity=30>>
```
Takeoff Plane
```
#<Airport:0x000000012f379030 @planes=[#<Plane:0x000000012f372988>], @capacity=30>>
airport.take_off => #<Airport:0x000000012f379030 @planes=[], @capacity=30>>
```
Built Using
-----

* Ruby
* RSpec
* Simplecov
* Rubocop

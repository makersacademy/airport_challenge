# Airport Challenge
### Makers Academy Weekend Challenge No.1

[![Build Status](https://travis-ci.org/KatHicks/airport_challenge.svg?branch=master)](https://travis-ci.org/KatHicks/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/airport_challenge?branch=master) [![Code Climate](https://codeclimate.com/github/KatHicks/airport_challenge/badges/gpa.svg)](https://codeclimate.com/github/KatHicks/airport_challenge)

### Instructions

* We were given from the end of the day on Friday until 9am on Monday to complete the challenge

### Task

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

You can see the full task and instructions given to us in [CONTRIBUTING.md](airport_challenge/CONTRIBUTING.md).

### Using my application

* Download source code
* Navigate to directory in your command line
* Run `$ bundle` to install all the dependencies listed in the Gemfile
  * Note that you will need Bundler installed to complete this. If you do not have Bundler installed, first type `$ gem install bundler`
* Run `irb` in the command line and interact with the programme as follows:

```
2.2.3 :001 > require './lib/airport.rb'
 => true
2.2.3 :002 > require './lib/plane.rb'
 => true
2.2.3 :003 > require './lib/weather.rb'
 => true
2.2.3 :004 > heathrow = Airport.new
 => #<Airport:0x007ff0e38ee6e0 @capacity=1, @planes=[]>
2.2.3 :005 > ba_plane = Plane.new
 => #<Plane:0x007ff0e38de9c0 @landing_status=nil>
2.2.3 :006 > ba_plane.land(heathrow)
 => true
2.2.3 :007 > ba_plane.confirm_landed?
 => true
2.2.3 :008 > heathrow.planes
 => [#<Plane:0x007ff0e38de9c0 @landing_status=true>]
2.2.3 :009 > ba_plane.take_off(heathrow)
 => false
2.2.3 :010 > ba_plane.confirm_landed?
 => false
2.2.3 :011 > ba_plane.confirm_take_off?
 => true
2.2.3 :012 > heathrow.planes
 => []
```

### Dependencies

* Written in **Ruby 2.2.3**
* Tested using **RSpec**

### Steps in my development process

* **Defining airport class**
  * Chose to start with testing for an airport class and then setting it's state in terms of capacity
    * Decided to amend the domain model structure shown to us during the week slightly to include a third 'state' column in the table
* **Defining a plane class**
  * Decided to define a plane class and test that it responds to all the methods/messages defined in the domain model
* **Added memory to store planes in airports**
  * Next step seemed to be to create some memory between the methods so that planes can be stored at different airports
    * Have some concern at this stage that the airport and plane classes are too entangled - but decided to proceed for now and then maybe revisit in refactoring stage
* **Implemented exception for airport capacity**
  * Next decided to move onto the user story that prevents a plane from landing if the airport is full. I'm now able to tackle this feature as there is memory (created in the previous step) for the airport to know how many planes are landed
* **Created predicate landing confirmation methods**
  * I'm now going to address the confirmation methods which are not fully functional
* **Created submission pull request**
 * Pull request: at this stage, I've decided to submit my first pull request having satisfied four out of six of the user stories.
 * Both Hound and Travis passed successfully
* **Created a weather class**
  * Now, I'm moving on to deal with the weather state. I'm not initially sure whether to make weather it's own class or a state of the airport class.
    * Decided to set weather as its own class - thinking ahead, it could be possible for weather to grow considerably and then become too entangled with airport. Also, it could be possible in the future for a flying plane to have a weather state.
    * Currently my use of stubs in the spec files is not very DRY. Need to find a way to set an overall environment and then when testing the stormy exceptions just set a different stub for those specific examples.
* **Mocking random weather in tests**
 * Next steps for development are to figure out a way to make my use of stubs in the spec file more DRY. Discovered `before` statements in Rspec which allow you to make a stub apply across the whole `describe` block. You can use `before` instead of `let` - initially got very stuck thinking that needed to use `let`.
* **Activated tests on repo**
  * Linked Travis CI to my Github account and all tests are passing
  * Linked Coveralls to my Github account and turned coveralls on for this repo
    * Have 98% test coverage
  * Added status badges for travis and coveralls
  * Activated Hound CI on my Github account and again activated it for this repo
* **Testing for edge cases**
  * Started trying to test for edge cases (at this point, ran out of time)


### Ideas for extension

* **Extend testing to edge cases**
  * Write further tests against edge cases and defend against them if there are any test failures
* **Implement a rspec feature test**
  * Write an rspec feature test that lands and takes off multiple planes - will also reveal if there are any remaining edge cases
* **Give planes a state to store their airport**
  * Give each `Plane` an instance variable called 'airport' which logs which airport it is currently in if landed and sets to nil if airborne

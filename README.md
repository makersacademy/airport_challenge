<h1 align='center'>
:airplane:
Airport Challenge 
:airplane:
</h1>

This application is controlling the flow of planes at an airport. The aircrafts can land and take off when the weather is the sunny, occasionally it may be stormy, in which case no planes can land or take off. 

## Build Status

[![Build Status](https://travis-ci.com/petraartep/airport_challenge.svg?branch=master)](https://travis-ci.com/petraartep/airport_challenge)

## User Stories

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
## Approach 
- Converting the user stories to objects and messages
- Creating seperate files for objects and module
- Feature test in irb
- Write the unit tests with RSpec before the code base to reach near 100 % coverage
- Run Rubocop and Travis CI regularly 

## Technologies Used

- Ruby 2.5.0
- RSpec 3.7
  - Rspec-core 3.7.1
  - Rspec-expectations 3.7.0
  - Rspec-mocks 3.7.0
  - Rspec-support 3.7.0
- Rubocop 0.60.0
- Simplecov

## Challenges 

- Reaching high test coverage
- Converting User Stories to Objects
- Using RSpec Mocks, Stubs
- All tests passing
- Clean code

## Passing Test Suites

<img src='https://user-images.githubusercontent.com/23095774/58767846-f1c86780-8588-11e9-8341-d4854bbee3ef.png' width='50%'>

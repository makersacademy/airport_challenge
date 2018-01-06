# Airport Challenge

[![Build Status](https://travis-ci.org/Leigan0/airport_challenge.svg?branch=master)](https://travis-ci.org/Leigan0/airport_challenge)
[![Coverage Status](https://coveralls.io/repos/github/Leigan0/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/Leigan0/airport_challenge?branch=master)

This code has been created to complete a challenge to create an airport system to meet the user stories given.

As user story requires weather to be considered prior to land/take off, I have added weather as an default parameter within Airport initialisation for ease of use. This has been tested within feature tests to ensure isolation of unit tests.

Edge cases considered - decision taken to implement planes to initialize flying - to allow to test that only flying planes can land, and non flying planes can take off.

I have aimed to solve this challenge using the BDD cycle, with a test driven approach.

I have included feature tests within the file - whilst I am aware these repeat some code, I have added individual tests for clarity at this stage in my progression.

## Getting started
* git clone git@github.com:Leigan0/airport_challenge.git
* bundle
* cd airport_challenge

## Usage
* To create an airport = Airport.new
* To create a plane = Plane.new
* To land a plane  - airport.land(plane)
* To take off a plane -  airport.take_off(plane)
* To check airport capacity - airport.capacity
* To set capacity airport.capacity = 20
* Note that weather conditions are checked at land and take off - if weather stormy - plane will not land/take off

## Running tests
RSpec

## Tecnologies used
* Ruby
* RSpec

## User Stories

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

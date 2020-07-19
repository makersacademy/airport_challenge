
#  Airport Challenge

[![Build Status](https://travis-ci.org/collier-jo/airport_challenge.svg?branch=master)](https://travis-ci.org/collier-jo/airport_challenge)

## Motivation

Main motivations for this project is:
- Commit commit commit that git
- Learn to TDD 
- Write code with consideration to OOPrinciples 
- Learn to Stub and Mock tests in RSPEC 

## Code style
Ruby-standard-style

## Tech/framework used
Built with: 

Ruby 
RSPEC 

## Code Example
Show what the library does as concisely as possible, developers should be able to figure out how your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Tests

99% test coverage


## Plan 

### User Story 

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

### Domain Model 

|Objects|	Messages|
|-------|-----------|
| airport ||
|| dock|
|| undock |
|| stromy weather |
|| full airport|
|plane||
||takeoff|
||land|
||location|
|weather||
||check weather|


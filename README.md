# Airport Challenge [![Build Status](https://travis-ci.org/georn/airport-challenge.svg?branch=continuous-integration)](https://travis-ci.org/georn/airport-challenge) [![Coverage Status](https://coveralls.io/repos/github/georn/airport-challenge/badge.svg?branch=continuous-integration)](https://coveralls.io/github/georn/airport-challenge?branch=continuous-integration)

**Weekend 1 Challenge at Makers Academy**

This project was also done in [Javascript ES5](https://github.com/georn/airportChallenge) and [Javascript ES6](https://github.com/georn/airportChallengeES6)

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

Main Task
-----

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

## Main Tasks List

- [x] A Plane can land at an airport and confirm it has landed
- [x] A Plane can take off from an airport and confirm it has taken off
- [ ] A Plane does not take off when weather is stormy
- [ ] A Plane does not land when weather is stormy
- [x] The airport have a default capacity
- [x] A Plane does not land when the airport is full
- [x] The airport capacity can be overridden

## Quickstart

First, you will need to clone the repository, change the directory and install the dependencies in order to run it:

```
git clone git@github.com:georn/airport-challenge.git
cd airport-challenge
bundle install #installing dependencies
```

Then you would need to just use irb using `irb -r './lib/airport.rb'`

Here is a test drive:

```
```

## Tech Stack

Here is a list of the technologies used:

- Ruby 2.4.0
- Rspec to testing
- Simplecov for testing coverage
- Rubocop to maintain styling
- Travis CI for continuous integration
- Coveralls for testing coverage hosted online

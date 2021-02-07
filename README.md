# AIRPORT CHALLENGE

[![Build Status](https://travis-ci.com/AJ8GH/airport_challenge.svg?branch=master)](https://travis-ci.com/AJ8GH/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/AJ8GH/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/AJ8GH/airport_challenge?branch=master) [![Maintainability](https://api.codeclimate.com/v1/badges/d2842c2f872b398661ac/maintainability)](https://codeclimate.com/github/AJ8GH/airport_challenge/maintainability)


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

## Objectives

An exercise in object oriented design, test driven development and domain modelling. This program has been designed to meet the needs of [user stories](#user-stories) in the client specification.

## Dependencies

- `rspec`
- `rake`
- `rubocop`
- `coveralls`

## Getting Started

Clone this repo

- `git clone git@github.com:AJ8GH/airport_challenge.git`

`cd` to root folder
- `cd airport_challenge`

Kick things off with

- `irb -r ./lib/flight_simulator.rb`

You are an air traffic controller. It's your job to ensure the safety of millions of people each week. Luckily the system you are using contains a number of fail safes making catastrophes much less likely.

- To begin with, instantiate one (or more) airport(s)
- Instantiate a plane (or a few). Planes start off in the air - as if they have just appeared on your air traffic control radar.

CODE SNIPPET

- Land and take off planes with the` #land` and `#take_off` methods. They require an aiport as an argument.
- When a plane is instructed to land or take off, it sends a request to the aiport. That request is normally approved, but will be denied in case of:
  - Requests to land or take off in extreme weather
  - Requests to land in airports with full capacity
  - Requests to take off from airports they are not in
- Planes will automatically reject invalid instrutions:
  - Being told to land when already grounded
  - Being told to take off when already airborne

CODE SNIPPET

## Skills applied

- `TDD` - Test driving every feature, writing unit tests and watching them fail, before adding any code
- Translating `user stories` into domain model, into unit tests, into code
- `Feature testing` - automated with `rspec` and manual with `irb`
- `OOP` - applying `SOLID` principles with the aim of achieving loosely coupled objects with maximum felxibility and tolerence for change. Creating lean methods and classes with a `single responsibility`
- Testing `edge cases` and `corner cases` thoroughly, ensuring reliability in extreme or inconsistent system states

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

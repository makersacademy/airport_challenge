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

An exercise in object oriented design, test driven development and domain modelling.

This program is designed to meet the needs of these client [user stories](#user-stories).

## Dependencies

- `rspec`
- `rake`
- `rubocop`
- `coveralls`

## Running tests

Run test suite to see thorough `documentation` of all classes and methods

After running bundle install, run tests with:
- `rspec`

## Skills applied

### Testing
- `TDD` - Test driving all code with automated unit tests
- `coveralls` - Achieving 100% test coverage
- `Travis CI` - Build passing
- `Feature testing` - Automated feature testing using `rspec`
- `Edge cases` and `corner cases` tested, ensuring system reliability in extreme and inconsistent states

### Design
- `Domain Modelling` - Translating `user stories` into unit tests, into code
- `OOP` - Applying `single responsibility principle`, `encapsulation`, `dependency injection`
- `Code Climate` - Grade A maintainability
- `Reek` - 0 code smells

## Getting Started

Clone this repo
- `git clone git@github.com:AJ8GH/airport_challenge.git`

Install Dependencies
- `gem install bundle` (if not already installed)
- `bundle install`

Head to the root folder
- `cd airport_challenge`

Kick things off with
- `irb -r ./lib/flight_simulator.rb`

## You are an air traffic controller

It's your job to ensure the safety of millions. Luckily the system implements a number of safety guards, making catastrophes far less likely.

![airplane!](https://media.giphy.com/media/wvWJOoYmFnSp2/giphy.gif)

## Messages

- Instantiate airports: `airport_name = Airport.new`
- Instantiate planes: `plane_name = Plane.new`
- Land planes: `plane_name.land(airport_name)`
- Take off planes: `plane_name.take_off(airport_name)`

_Note: Planes start off in the air - as if they have just entered your airspace and appeared on your radar._

```
irb -r ./lib/flight_simulator.rb

2.6.5 :001 > LHR = Airport.new
 => #<Airport:0x00007f903b116c00 @capacity=50, @planes=[]>

2.6.5 :002 > dream_liner = Plane.new
 => #<Plane:0x00007f903b1ebef0 @status=:air>

2.6.5 :003 > private_jet = Plane.new
 => #<Plane:0x00007f903b208988 @status=:air>

2.6.5 :004 > dream_liner.land(LHR)
 => :ground
```

Airports have a default capacity of 50 aircraft. Give an integer argument to `new` to initialize with a different capacity:

```
2.6.5 :027 > LAX = Airport.new(200)
=> #<Airport:0x00007f902c0154f0 @capacity=200, @planes=[]>
```

Or use the writer method `capacity=` to change after initialization:
```
2.6.5 :028 > LHR.capacity = 500
 => 500
```

After successfully landing and taking off, planes auto-update their `status` attribute to `ground` and `air` respectively. The updated `status` is the return value of the `land` and `take_off` methods, giving confirmation of success.

```
2.6.5 :003 > jumbo_jet.land(DXB)
 => :ground

2.6.5 :004 > jumbo_jet.take_off(DXB)
 => :air
```

The `contain?` method gives additional confirmation, letting users see whether a plane is in a given airport:

```
2.6.5 :033 > JFK.contain?(boeing_747)
 => false

2.6.5 :034 > boeing_747.land(JFK)
 => :ground

2.6.5 :035 > JFK.contain?(boeing_747)
 => true

2.6.5 :036 > boeing_747.take_off(JFK)
 => :air

2.6.5 :037 > JFK.contain?(boeing_747)
 => false
```

## System Guard Conditions

When you plane instruct a plane to land or take off, you must pass an airport as an argument. The plane sends a request to the airport, which will either be approved or denied

### The Air Traffic Control mixin

Denies requests to:

- Land or take off in extreme weather - throws: `WeatherError`
  - The `weather forcast` is local to each airport and determined by `atmospheric pressure` (a randomly generated number between 0 and 100). When pressure is very low (< 10), the forcast will be `stormy` and all take offs and landings are prevented

```
2.6.5 :005 > private_jet.land(LHR)

Traceback (most recent call last): ...
WeatherError (Request Denied: Extreme weather)
```
![windy](https://media.giphy.com/media/M9tpu3TPG42n6/giphy.gif)

- Land at an airport at full capacity - throws: `CapacityError`

```
2.6.5 :040 > LGW = Airport.new(10)
 => #<Airport:0x00007f902b01eb00 @capacity=10, @planes=[]>

2.6.5 :041 > 10.times { Plane.new.land(LGW) }
 => 10

2.6.5 :042 > Plane.new.land(LGW)

Traceback (most recent call last): ...
CapacityError (Request Denied: Airport capacity full)
```

- Take off from an airport the plane is not in - throws: `AirportError`

```
2.6.5 :044 > airbus.land(LAX)
 => :ground

2.6.5 :045 > airbus.take_off(LHR)

Traceback (most recent call last): ...
AirportError (Request Denied: Plane not located in airport)
```

### Planes automatically reject invalid instructions

- Instructing grounded planes to land - throws: `LandingError`

```
2.6.5 :048 > airbus.land(LHR)

Traceback (most recent call last): ...
LandingError (Plane already grounded)
```

- Instructing airborne planes to take off, throws: `TakeOffError`

```
2.6.5 :049 > airbus.take_off(LAX)
 => :air

2.6.5 :050 > airbus.take_off(LAX)

Traceback (most recent call last): ...
TakeOffError (Plane already airborne)
```

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

## Reflections

- I am pleased with the outcome of the program and feel that it meets the requirements.
- Given more time I'd like to:
  - Add an optional hash of arguments to Plane's initialize method, allowing it to also be initialized in an airport
  - Add verification to the `capacity=` writer method so that only an integer can be given
  - Add a password feature so that only authorised users can change the capacity
- This exercise has made me more determined to master object oriented design, in particular SOLID principles.
- My long term goal is to be confident in designing complex programs from scratch, using loosely coupled objects with minimal dependencies and well designed public interfaces.


## Mission Accomplished

![goose and maverick](https://media.giphy.com/media/39hsA5NQKeaFXNgMav/giphy.gif)

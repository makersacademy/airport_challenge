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

You are now air traffic controller! It's your job to ensure the safety of millions. Luckily the system implements a number of safety guards, making catastrophes far less likely.

![airplane!](https://media.giphy.com/media/wvWJOoYmFnSp2/giphy.gif)

## Messages

- Instantiate airports: `airport_name = Airport.new`
- Instantiate planes: `plane_name = Plane.new`
- Land planes with: `plane_name.take_off(airport_name)`
- take off planes with: `plane_name.take_off(airport_name)`

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

Airports have a default capacity of 50 aircraft. Give an integer argument to initialize with a different capacity:

```
2.6.5 :027 > LAX = Airport.new(200)
=> #<Airport:0x00007f902c0154f0 @capacity=200, @planes=[]>
```

Or use the writer method to change after initialization:
```
2.6.5 :028 > LHR.capacity = 500
 => 500
```

The `contain?` method confirms if a plane has left or entered the airport after take off or landing:

```
2.6.5 :033 > JFK.contain?(boeing_747)
 => false
2.6.5 :034 > boeing_747.land(JFK)
 => :ground
2.6.5 :035 > JFK.contain?(boeing_747)
 => true
2.6.5 :037 > boeing_747.take_off(JFK)
 => :air
2.6.5 :038 > JFK.contain?(boeing_747)
 => false
```

## System Guard Conditions

When you plane instruct a plane to land or take off, you must pass an airport as an argument. The plane sends a request to the airport, which in some cases will be denied by the Air Traffic Control mixin:

- Requesting to land or take off in extreme weather throws: `WeatherError`. The weather forcast is local to each airport and is generated randomly. When *atmospheric pressure* becomes *very low*, the forcast will be `stormy` and all take offs and landings are prevented.

```
2.6.5 :005 > private_jet.land(LHR)
Traceback (most recent call last): ...
WeatherError (Request Denied: Extreme weather)
```
![windy](https://media.giphy.com/media/M9tpu3TPG42n6/giphy.gif)

- Requesting to land at an airport at full capacity throws: `CapacityError`

```
2.6.5 :040 > LGW = Airport.new(10)
 => #<Airport:0x00007f902b01eb00 @capacity=10, @planes=[]>
2.6.5 :041 > 10.times { Plane.new.land(LGW) }
 => 10
2.6.5 :042 > Plane.new.land(LGW)
Traceback (most recent call last): ...
CapacityError (Request Denied: Airport capacity full)
```

- Requesting to take off from an airport the plane is not in throws: `AirportError`

```
2.6.5 :044 > airbus.land(LAX)
 => :ground
2.6.5 :045 > airbus.take_off(LHR)
Traceback (most recent call last): ...
AirportError (Request Denied: Plane not located in airport)
```

- Planes automatically reject invalid instructions. Instructing grounded plane to land throws: `LandingError`

```
2.6.5 :048 > airbus.land(LHR)
Traceback (most recent call last): ...
LandingError (Plane already grounded)
```

  - Instructing airborne plane to take off throws: `TakeOffError`

```
2.6.5 :049 > airbus.take_off(LAX)
 => :air
2.6.5 :050 > airbus.take_off(LAX)
Traceback (most recent call last): ...
TakeOffError (Plane already airborne)
```

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

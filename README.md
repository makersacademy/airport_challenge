# Airport Challenge

[![Build Status](https://travis-ci.org/dylanrhodius/airport-challenge.svg?branch=master)](https://travis-ci.org/dylanrhodius/airport-challenge) [![Coverage Status](https://coveralls.io/repos/github/dylanrhodius/airport-challenge/badge.svg?branch=master)](https://coveralls.io/github/dylanrhodius/airport-challenge?branch=master)

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__  DYLAN AIRLINES  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## The Task
An air traffic controller/airport simulation programme had to be created.

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
[Link to Makers Academy's instructions](https://github.com/dylanrhodius/airport-challenge/blob/master/MA_Instructions.md)

## The Approach

It was assumed that an airport instance would be handling take-off and landing requests. The same airport would be responsible for keeping track of all the planes. Following the single responsibility principle, this project's classes could have been further broken down.
The application was developed following TDD principles.
In this application, several classes were created:
* `Airport`
* `Plane`
* `Weather`

The app allows to create several instances of an airport which are initialised with a random weather condition: either stormy (5% chance), or clear (95% chance). When stormy, planes can neither take-off or land. Different instances of plane objects can be created and then landed into an airport.

## Installing the APP
Clone the repository from [GitHub](https://github.com/dylanrhodius/airport-challenge) and then move into that repository.

```
$ git clone git@github.com:dylanrhodius/airport-challenge.git
$ cd airport-challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```

## Using the APP
Load the app in IRB
```
$ irb
```

```
:001 > require './lib/plane'
 => true
 :002 > require './lib/weather'
 => true
 :003 > require './lib/airport'
 => true
 :004 > airport = Airport.new
 => #<Airport:0x007fa51a01abc8 @planes=[], @capacity=2, @weather="sunny">
 :005 > plane = Plane.new
 => #<Plane:0x007fa51a0040d0 @status="Airborne.">
 :006 > plane2 = Plane.new
 => #<Plane:0x007fa51a81c0b0 @status="Airborne.">
 :007 > airport.land(plane)
 => #<Plane:0x007fa51a0040d0 @status="Plane landed.">
 :008 > plane.status?
 => "Plane landed."
 :009 > airport.land(plane2)
 => #<Plane:0x007fa51a81c0b0 @status="Plane landed.">
 :010 > airport
 => #<Airport:0x007fa51a01abc8 @planes=[#<Plane:0x007fa51a0040d0 @status="Plane landed.">, #<Plane:0x007fa51a81c0b0 @status="Plane landed.">], @capacity=2, @weather="sunny">
 :011 > airport.take_off
 => "Plane departed."
 :012 > airport.take_off
 => "Plane departed."
 :013 > airport
 => #<Airport:0x007fa51a01abc8 @planes=[], @capacity=2, @weather="sunny">
 :014 > exit
```

## Further Developments
* Should not be able to land same plane twice.
* Allow to choose which plane to quit airport.


## Contributors
Used some of my colleague's GitHub repos for README references:

* Mitchell Goldbay [github](https://github.com/mbgimot/)
* Rick Clark [github](https://github.com/rkclark/)

Airport Challenge
=================

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/dylanrhodius/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/dylanrhodius/airport_challenge?branch=master)

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

The Task
-----
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
[Link to Makers Academy's instructions](https://github.com/dylanrhodius/airport_challenge/blob/master/MA_Instructions.md)

My Approach to the Task
-----


Installing the APP
-----
Clone the repository from [GitHub](https://github.com/dylanrhodius/airport_challenge) and then move into that repository.

```
$ git clone git@github.com:dylanrhodius/airport_challenge.git
$ cd airport_challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```

Load the app in IRB
```
irb
```

Using the APP
-----
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

Further Developments
-----
* Should not be able to land same plane twice.
* Allow to choose which plane to quit airport.


Contributors
-----
Used some of my colleague's GitHub repos for README references:

* Mitchell Goldbay [github](https://github.com/mbgimot/)
* Rick Clark [github](https://github.com/rkclark/)

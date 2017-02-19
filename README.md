Narayan's Airport Challenge 
=================

[![Build Status](https://travis-ci.org/nryn/airport_challenge.svg?branch=master)](https://travis-ci.org/nryn/airport_challenge)

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

Usage
---------

* Open a Ruby shell in the project's root directory
* To start, type
    `require lib/start.rb`
* You can create Planes like this
    `enola_gay = Plane.new`
* You can create Airports like this
    `stn = Airport.new`
* At the point of creating an Airport you can specify:
  * The size of the Airport (how many planes its hangar can hold)
  * The Airport's location
    `lgw = Airport.new(125, "London Gatwick")`
* Air Traffic Control at airports can do a number of things:
  * Land planes that are in the sky, or at the plane factory
    `stn.land(enola_gay)`
  * Have a plane take off
    `stn.takeoff`
  * Tell you the name of the airport
    `lgw.name`
  * Show you all the planes in the hangar
    `jfk.check_hangar`
  * Tell you how many planes they hold at capacity
    `nrt.capacity`
  But what they can't do is land planes or have planes take off when it's stormy. It can be stormy, sometimes without warning. You'll see a descriptive error message when this is the case.
* Planes can do a couple of things:
  * Tell you their flight number
    `enola_gay.flight_number`
  * Tell you where they are, be it at the factory, in the sky, or in a particular Airport hangar.
    `enola_gay.location`

Dependencies
--------------

* Ruby 2.2.3
* To get dependencies `gem install bundle` and then `bundle`.


Description
-------------

Software which models the control and flow of planes at an airport.
The planes can land and take off provided that the weather is nice.
Occasionally it may be stormy, in which case no planes can land or take off.
Here are the user stories that we worked out in collaboration with the client:

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

The weather is mostly clear, but storms will occasionally prevent takeoffs and landings.

The code defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

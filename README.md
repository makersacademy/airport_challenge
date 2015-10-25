Airport Challenge
=================

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

Instructions
------------
1. Fork repo and then clone using `git clone <url>`
2. In the relevant folder run `gem install bundle` and then `bundle`
3. In irb, you can use the program in the following way:

```ruby
require './lib/airport'
JFK = Airport.new  # => #<Airport:0x007ffef4072100 @weather="sunny", @planes=[], @capacity=50>
my_plane = Plane.new # => #<Plane:0x007ffef4063010 @flying_status=true>
JFK.plane_land(my_plane) # => [#<Plane:0x007ffef4063010 @flying_status=false>]
JFK.in_this_airport?(my_plane) # => true
JFK.plane_take_off(my_plane) # => #<Plane:0x007ffef4063010 @flying_status=true>

```

Approach
--------
This was my first Weekend Challenge at Makers Academy. The original task is outlined further down; in a nutshell, I was asked to use Ruby build an airport with the capacity for planes. I used a modular approach, with two main classes, Airport and Plane. My intent was to make the code as efficient and DRY as possible within the limits of my experience. The functions of each class were based on real life logic: for instance, at a real airport the air traffic controller gives permission for takeoff and landing, so my Airport class carries the responsibility for these things, rather than the planes themselves. All the user stories below are accounted for. The program is easy to run in irb - just use the commands listed above. Have fun!

Notes
-----
* There is an Airport class, which features an array that planes can take off from and land in.
* An airport has a default capacity of 50 planes; the capacity can be changed by the user via an optional argument when calling `Airport.new`
* There is a Plane class; `Plane.new` defaults to 'flying' (`flying_status: true`).
* The weather is handled via a separate Weather module; this works similarly to a die, and introduces a 1 in 6 chance of stormy conditions. Airports will not allow planes to take off or land in stormy weather.
* You cannot land a plane that is already in an airport, because its flying_status will be false; it will need to take off first.

The Original Task
-----------------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So planes can land safely at my airport
I would like to instruct a plane to land

As an air traffic controller
So planes can take off safely from my airport
I would like to instruct a plane to take off

As an air traffic controller
So that I can avoid collisions
I want to prevent airplanes landing when my airport if full

As an air traffic controller
So that I can avoid accidents
I want to prevent airplanes landing or taking off when the weather is stormy

As an air traffic controller
So that I can ensure safe take off procedures
I want planes only to take off from the airport they are at

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a flying plane cannot take off and cannot be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that is not flying cannot land and must be in an airport

As an air traffic controller
So the system is consistent and correctly reports plane status and location
I want to ensure a plane that has taken off from an airport is no longer in that airport
```

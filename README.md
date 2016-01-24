
Airport Challenge
=================
Makers Academy weekend challenge 1 - 24 Jan 2016
------------------------------------------------

https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master
Includes: gems, ruby classes & rspec unit tests

Requirements:
------------
Create a Ruby programme to allow air traffic control to instruct planes to land
and take-off from airports unless the weather is stormy. Airports should have a
fixed capacity which can be set and should not accept additional planes landing
when full.


Approach:
--------
This programme uses a number of different classes;
AirTrafficControl - which carries all inflight planes and is responsible for
instructing landing and take-off sequences. Airport - which captures all planes
landing at a particular airport. PlaneContainer module - which consolidates
methods used by both AirTrafficControl and Airport to sign planes in/out and set
default capacity and full criteria. Airplane - which captures each planes status
(landed/inflight) and reference location. Weather - which produces a random
assignment of stormy weather (1/10 chance of bad weather).

I wanted to use the ability to include mixins as learnt during the boris bikes
exercise and to create a contained system where planes would always belong in
one place (hence landing/take-off actions undertaken by the air traffic control
have automatic knock-on to check planes in/out of an airport). This is a little
more complicated than necessary, but I wanted to test how this might work and
be unit/feature tested.

Week 1 - Airport Challenge
=================

Task
---------
To write a software that controls the flow of planes at an airport (see user stories below). The planes can land and take off if the weather is sunny, but if the weather is stormy then no planes can land or take off. 

Aim
---------

To test my TDD skills using RSpec and Ruby. 


User Stories
---------

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

Instructions
---------

Elenis-MacBook:airport_challenge eleniskouroupathi$ irb
```
2.2.3 :001 > require './lib/airport.rb'
=> true 

2.2.3 :002 > plane = Plane.new
=> #<Plane:0x007fe3208ba550 @flying=true> 

2.2.3 :003 > airport = Airport.new
=> #<Airport:0x007fe3208a2888 @planes=[], @weather=#<Weather:0x007fe3208a2860>, @capacity=6> 

2.2.3 :004 > airport.land plane
=> [#<Plane:0x007fe3208ba550 @flying=false>] 

2.2.3 :005 > airport.take_off plane
$ <Plane:0x007fe3208ba550 @flying=true>
```

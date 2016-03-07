Airport Challenge
=================

Makers Weekend Challenge 1

The following code base provides responses to the following user stories:
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
To run this code, clone the repository into your local directory of choice

```
git clone https://github.com/gvonkoss/airport_challenge.git

cd airport_challenge
```
And follow instructions below.

According to the principles behind TDD, the simplest code has been implemented to satisfy the above requirements, and can be used in the following way to instantiate an airplane, make it airborne, land it and instruct it to take off (which is impeded if -by random assignment- the weather is stormy).

```
2.2.3 :001 > require './lib/airport'
=> true
2.2.3 :002 > airport = Airport.new(3)
=> #<Airport:0x007ff2fb11a4e0 @planes=[], @weather=#<Weather:0x007ff2fb11a440>, @capacity=3>
2.2.3 :003 > plane = Plane.new
=> #<Plane:0x007ff2fb0b05b8 @flying=false>
2.2.3 :004 > plane.take_off
=> true
2.2.3 :005 > airport.land(plane)
=> [#<Plane:0x007ff2fb0b05b8 @flying=false>]
2.2.3 :006 > airport
=> #<Airport:0x007ff2fb11a4e0 @planes=[#<Plane:0x007ff2fb0b05b8 @flying=false>], @weather=#<Weather:0x007ff2fb11a440>, @capacity=3>
2.2.3 :007 > airport.take_off(plane)
RuntimeError: Plane cannot take off in bad weather
from /Users/Gabrielle/Makers/WeekendChallenges/airport_challenge/lib/airport.rb:25:in `take_off'
from (irb):7
from /Users/Gabrielle/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > airport.take_off(plane)
=> true
2.2.3 :009 > plane.flying
=> true
```

Amongst other cases, planes that are airborne cannot be instructed to take off, as planes that are on the ground cannot be instructed to land. 

The included feature test verifies that a number of planes can be instructed to land at a given airport, and that the correct plane is airborne once instructed to take off.

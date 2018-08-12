Airport Challenge
=================

This projects simulates airport traffic control. Airport capacity can be overwritten and weather can vary. Planes can land and take off from an airport, if capacity allows and weather permitting. 

Using my decision tree, I input the 6 user stories provided and followed the TDD approach. 

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

It can be run in command line as follows:

```
$ irb
2.5.0 :001 > require './lib/airport'
 => true 
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007f868b0e97f0 @planes=[], @capacity=50, @weather=#<Weather:0x00007f868b0e97c8>> 
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007f868b0e0bf0> 
2.5.0 :004 > airport.plane_land(plane)
 => true 

```

Planes cannot land before taking-off again, take-off before landing, or land/take-off in bad weather.

```

2.5.0 :005 > airport.plane_land(plane)
Traceback (most recent call last):
        4: from /Users/rashikapatel/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):5
        2: from /Users/rashikapatel/Documents/Projects/airport_challenge/lib/airport.rb:15:in `plane_land'
        1: from /Users/rashikapatel/Documents/Projects/airport_challenge/lib/airport.rb:35:in `check_plane_can_land'
RuntimeError (Plane already at airport)
2.5.0 :006 > plane2 = Plane.new
 => #<Plane:0x00007f868b0c3a28> 
2.5.0 :007 > airport.plane_land(plane2)
 => true 
2.5.0 :009 > airport.plane_take_off(plane2)
 => false 
2.5.0 :010 > airport.plane_take_off(plane2)
Traceback (most recent call last):
        4: from /Users/rashikapatel/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):11
        2: from /Users/rashikapatel/Documents/Projects/airport_challenge/lib/airport.rb:21:in `plane_take_off'
        1: from /Users/rashikapatel/Documents/Projects/airport_challenge/lib/airport.rb:40:in `check_plane_can_take_off'
RuntimeError (Bad weather, plane cannot take off)
2.5.0 :011 > 

```

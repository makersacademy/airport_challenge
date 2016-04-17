Airport Challenge
=================

It is part of weekend challenge.below are the user stories I worked on it, My task is to test drive the creation of a set of classes/modules to satisfy the below user stories.

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


2.2.3 :001 > require './lib/airport.rb'
 => true 
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x00000000d220a8 @planes=[], @capacity=20, @weather=#<Weather:0x00000000d22008>> 
2.2.3 :003 > weather = Weather.new
 => #<Weather:0x00000000d0d130> 
2.2.3 :004 > plane = Plane.new
 => #<Plane:0x00000000cf0d50> 
2.2.3 :005 > airport.landing(plane)
 => [#<Plane:0x00000000cf0d50>] 
2.2.3 :006 > plane1 = Plane.new
 => #<Plane:0x00000000cbfc28> 
2.2.3 :007 > airport.landing(plane1)
 => [#<Plane:0x00000000cf0d50>, #<Plane:0x00000000cbfc28>] 
2.2.3 :008 > weather.stormy?
 => true 
2.2.3 :009 > airport.landing(plane1)
 => [#<Plane:0x00000000cf0d50>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>] 
2.2.3 :010 > airport.landing(plane1)
 => [#<Plane:0x00000000cf0d50>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>] 
2.2.3 :011 > airport.landing(plane1)
 => [#<Plane:0x00000000cf0d50>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>] 
2.2.3 :012 > airport.landing(plane1)
 => [#<Plane:0x00000000cf0d50>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>, #<Plane:0x00000000cbfc28>] 
2.2.3 :013 > airport.landing(plane1)
RuntimeError: Unable to land due to stormy weather
	from /home/namitha/Documents/week1/airport_challenge/lib/airport.rb:16:in `landing'
	from (irb):13
	from /usr/share/rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :014 > airport.departure(plane)
 => #<Plane:0x00000000cbfc28> 
2.2.3 :015 > airport.departure(plane)
 => #<Plane:0x00000000cbfc28> 
2.2.3 :016 > airport.departure(plane)
 => #<Plane:0x00000000cbfc28> 
2.2.3 :017 > airport.departure(plane)
 => #<Plane:0x00000000cbfc28> 
2.2.3 :018 > airport.departure(plane)
 => #<Plane:0x00000000cbfc28> 
2.2.3 :019 > airport.departure(plane)
RuntimeError: Unable to takeoff due to stormy weather
	from /home/namitha/Documents/week1/airport_challenge/lib/airport.rb:21:in `departure'
	from (irb):19
	from /usr/share/rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'



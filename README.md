Airport Challenge

Task
-------

Building a program that accepts Planes to an Airport. The Airport has a capacity and the behaviour of the airport will depend on weather conditions.


IRB
---------

2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fce5b11c598 @planes=[], @capacity=30>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fce5b10e538>
2.2.3 :004 > weather = Weather.new
 => #<Weather:0x007fce5a923850 @weather=["stormy", "fine"]>
2.2.3 :005 > airport.land(plane, weather)
RuntimeError: Bad weather
	from /Users/Marlon/Desktop/airport_challenge/lib/airport.rb:22:in `land'
	from (irb):5
	from /Users/Marlon/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > airport.land(plane, weather)
 => [#<Plane:0x007fce5b10e538 @airport=true>]


User Stories
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


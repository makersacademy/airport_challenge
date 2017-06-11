
## Airport Challenge ##

A CL-script controlling aircraft flow in and out of airports. Two major constraints are set on aircraft flow. One is that airports cannot land planes when their hangers are full, the other that airports cannot takeoff or land planes when it's stormy. Logical constraints are also enforced: airports can't land or takeoff planes that are already grounded or airborne respectively. And location matters. An airport can only takeoff its own planes, not those belonging to another airport.

The capacity of airports can be set on their creation. If not specified they will default to 20.

## Run ##

Run the following commands:

```
$ git clone git@github.com:jkingharman/airport_challenge.git
$ cd airport_challenge
$ bundle
$ ruby ./lib/airport.rb
```
## Test ##

```
$ rspec
```

## My Approach ##

I split the the script's responsibilities over three classes: __Airport__, __Weather__ and __Plane__.

Broadly:

Airport understands how to land and take off aircraft.

Plane understands how to move through air.

Weather understands how to sometimes be stormy.

__Airport__

This class creates instances of airports. Airports's public interface consists of the methods 'land' and 'take_off', which take instances of Plane as arguments. These methods check some things. Namely:

*	__the in_flight state of the plane__
*	__the weather's conditions__
*	__the capacity of the airport's hanger__

When all of these checks pass, the methods then either call 'land' or 'fly' on the plane
passed in. The effect of this is to alter the planes in_flight status.

__Plane__

Creates instances of planes.

__Weather__

Airport depends on instances of Weather. When airports are created, a weather object is injected into them. The weather object's public interface consists of 'stormy?'. It varies its state by periodically sampling certain weather conditions throughout the lifespan of the script (sampling occurs within a thread), and stormy returns true or false depending on the current condition.

## IRB Example ##

```
2.4.0 :001 > require "./lib/airport.rb"
 => true
2.4.0 :002 > heathrow = Airport.new(20)
 => #<Airport:0x007f9a01097750 @capacity=20, @weather=#<Weather:0x007f9a01097700>, @hanger=[]>
2.4.0 :003 > boeing = Plane.new
 => #<Plane:0x007f9a01064b70 @in_flight=true>
2.4.0 :004 > gatwick = Airport.new(2)
 => #<Airport:0x007f9a0104e690 @capacity=2, @weather=#<Weather:0x007f9a0104e5f0 @conditions=:sunny>, @hanger=[]>
2.4.0 :005 > jet = Plane.new
 => #<Plane:0x007f9a010378a0 @in_flight=true>
2.4.0 :006 > cessna = Plane.new
 => #<Plane:0x007f9a01026d70 @in_flight=true>
2.4.0 :007 > gatwick.land(boeing)
 => [#<Plane:0x007f9a01064b70 @in_flight=false>]
2.4.0 :008 > heathrow.land(jet)
 => [#<Plane:0x007f9a010378a0 @in_flight=false>]
2.4.0 :009 > gatwick.land(jet)
RuntimeError: The aircraft is not flying
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:26:in `check_airspace_for'
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:43:in `prepare_for_landing'
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:67:in `land'
	from (irb):9
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :010 > gatwick.land(cessna)
 => [#<Plane:0x007f9a01064b70 @in_flight=false>, #<Plane:0x007f9a01026d70 @in_flight=false>]
2.4.0 :011 > gatwick.takeoff(jet)
RuntimeError: The aircraft is not here
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:30:in `check_hanger_for'
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:49:in `prepare_for_takeoff'
	from /Users/jkh/Desktop/Projects/airport_challenge/lib/airport.rb:73:in `takeoff'
	from (irb):11
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :012 > gatwich.takeoff(cessna)
NameError: undefined local variable or method `gatwich' for main:Object
Did you mean?  gatwick
	from (irb):12
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :013 > gatwick.takeoff(cessna)
 => true
2.4.0 :014 > gatwick
 => #<Airport:0x007f9a0104e690 @capacity=2, @weather=#<Weather:0x007f9a0104e5f0 @conditions=:fair>, @hanger=[#<Plane:0x007f9a01064b70 @in_flight=false>]>
2.4.0 :015 > gatwick
 => #<Airport:0x007f9a0104e690 @capacity=2, @weather=#<Weather:0x007f9a0104e5f0 @conditions=:sunny>, @hanger=[#<Plane:0x007f9a01064b70 @in_flight=false>]>
2.4.0 :016 > gatwick
 => #<Airport:0x007f9a0104e690 @capacity=2, @weather=#<Weather:0x007f9a0104e5f0 @conditions=:sunny>, @hanger=[#<Plane:0x007f9a01064b70 @in_flight=false>]>
2.4.0 :017 > heathrow
 => #<Airport:0x007f9a01097750 @capacity=20, @weather=#<Weather:0x007f9a01097700 @conditions=:fair>, @hanger=[#<Plane:0x007f9a010378a0 @in_flight=false>]>
2.4.0 :018 > gatwick
 => #<Airport:0x007f9a0104e690 @capacity=2, @weather=#<Weather:0x007f9a0104e5f0 @conditions=:stormy>, @hanger=[#<Plane:0x007f9a01064b70 @in_flight=false>]>
2.4.0 :019 > gatwick.land(cessna)
 => [#<Plane:0x007f9a01064b70 @in_flight=false>, #<Plane:0x007f9a01026d70 @in_flight=false>]
2.4.0 :020 >
```

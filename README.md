#Airport Challenge

##Description
A program to control the flow of planes into and out of airports. Take off and landing are restricted when weather conditions are poor, and airports cannot accept landings once they have reached capacity. Capacity can be set by the user for each individual airport, but defaults to 20 when left unspecified.

##Classes
This program has three classes:
1. Airport
2. Plane
3. Weather

###Airport
This class creates instances of airports and includes the methods `land` and `take_off` which take instances of the Plane class as arguments. Within these methods, the following checks are made:

* the `in_flight` state of the plane
* the current weather conditions
* the current capacity of the airport

If all checks are passed, methods `ground` or `fly` are called in order to alter the plane's `in_flight` attribute. These are methods belonging to the Plane class - Airport is thus dependent on Plane.

###Plane
This class creates instances of planes and includes the methods `ground` and `fly` as discussed above.

###Weather
This class creates instances of weather each time the `check_weather` method is called from within Airport class. Weather conditions are created using a random number generator such that it the probability of a storm is 20%.

##Feature test
```
$irb
2.3.0 :001 > require './lib/airport'
 => true
2.3.0 :002 > gatwick = Airport.new 2
 => #<Airport:0x007f93a2900500 @planes=[], @capacity=2>
2.3.0 :003 > heathrow = Airport.new
 => #<Airport:0x007f93a38a2fa8 @planes=[], @capacity=20>
2.3.0 :004 > plane1 = Plane.new
 => #<Plane:0x007f93a3892040 @in_flight=true>
2.3.0 :005 > plane2 = Plane.new
 => #<Plane:0x007f93a38888b0 @in_flight=true>
2.3.0 :006 > plane3 = Plane.new
 => #<Plane:0x007f93a387b9a8 @in_flight=true>
2.3.0 :007 > gatwick.land(plane1)
 => [#<Plane:0x007f93a3892040 @in_flight=false>]
2.3.0 :008 > gatwick.land(plane2)
 => [#<Plane:0x007f93a3892040 @in_flight=false>, #<Plane:0x007f93a38888b0 @in_flight=false>]
2.3.0 :009 > gatwick.land(plane3)
RuntimeError: Sorry, we've got more planes than you can shake a stick at.
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:41:in `check_space'
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):9
	from /Users/Billy/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :010 > heathrow.land(plane3)
RuntimeError: Ach no, there's a storm a-brewin'!
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:33:in `check_weather'
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):10
	from /Users/Billy/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :011 > heathrow.land(plane3)
 => [#<Plane:0x007f93a387b9a8 @in_flight=false>]
2.3.0 :012 > heathrow.land(plane3)
RuntimeError: Plane's aleady down, Sir.
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:49:in `check_in_flight'
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):12
	from /Users/Billy/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :013 > gatwick.take_off(plane1)
 => #<Plane:0x007f93a3892040 @in_flight=true>
2.3.0 :014 > gatwick.take_off(plane1)
RuntimeError: Plane's already up there, Sir.
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:53:in `check_in_airport'
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):14
	from /Users/Billy/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :015 > heathrow.take_off(plane2)
RuntimeError: Plane's in another airport, Sir.
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:54:in `check_in_airport'
	from /Users/Billy/makers_academy/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):15
	from /Users/Billy/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
```

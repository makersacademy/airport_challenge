# Airport Challenge #

I've split the program into three classes: Airport, Plane and Weather. The weather randomly generates whether is is stormy or not, with a bias towards good weather. Planes can land or take off depending on their current state. If a plane has already landed, it cannot land again and vice versa for take off. Errors are raised if airport is full or empty. There is a default capacity set for the airport if no capacity is entered when an airport is created.

## Feature test: ##
```
$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new 2
 => #<Airport:0x007fdc78876f20 @planes=[], @capacity=2>
2.2.3 :003 > p1 = Plane.new
 => #<Plane:0x007fdc7886d560 @in_flight=true>
2.2.3 :004 > p2 = Plane.new
 => #<Plane:0x007fdc7885da48 @in_flight=true>
2.2.3 :005 > airport.land p1
RuntimeError: Stormy weather is affecting flight
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:33:in `weather_check'
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):5
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > airport.land p2
 => "The plane has landed"
2.2.3 :007 > airport.planes
 => [#<Plane:0x007fdc7885da48 @in_flight=false>]
2.2.3 :008 > p3 = Plane.new
 => #<Plane:0x007fdc78826ed0 @in_flight=true>
2.2.3 :009 > airport.land p3
 => "The plane has landed"
2.2.3 :010 > airport.take_off p1
RuntimeError: No such plane at this airport
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:23:in `take_off'
	from (irb):10
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :011 > airport.take_off p2
 => "The plane has taken off"
2.2.3 :012 > airport.take_off p3
 => "The plane has taken off"
2.2.3 :013 > airport.land p1
 => "The plane has landed"
2.2.3 :014 > airport.land p1
RuntimeError: Plane has already landed
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):14
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :015 > airport.land p2
 => "The plane has landed"
2.2.3 :016 > airport.land p3
RuntimeError: Aiport is full
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:15:in `land'
	from (irb):16
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :017 > airport.take_off p2
 => "The plane has taken off"
2.2.3 :018 > airport.take_off p1
RuntimeError: Stormy weather is affecting flight
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:33:in `weather_check'
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):18
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :019 > airport.take_off p1
 => "The plane has taken off"
2.2.3 :020 > airport.take_off p3
RuntimeError: Airport is empty
	from /Users/Aga/Projects/airport_challenge/lib/airport.rb:22:in `take_off'
	from (irb):20
	from /Users/Aga/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
  ```

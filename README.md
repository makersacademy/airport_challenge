# Airport Challenge

## The Airport Class





 ### Landing and Taking Off

 2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fe59409c528 @landed_planes=[], @capacity=20>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fe59408eba8 @flying=false>
2.2.3 :004 > weather = Weather.new
 => #<Weather:0x007fe59407edc0 @stormy=false>
2.2.3 :005 > airport.landed_planes
 => []
2.2.3 :006 > airport.land(plane, weather)
 => [#<Plane:0x007fe59408eba8 @flying=false>]
2.2.3 :007 > airport.landed_planes
 => [#<Plane:0x007fe59408eba8 @flying=false>]
2.2.3 :008 > airport.take_off(plane, weather)
 => #<Plane:0x007fe59408eba8 @flying=true>
2.2.3 :009 > airport.landed_planes.include?(plane)
 => false
2.2.3 :010 > plane.flying?
 => true

### Checks For Stormy Weather

2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007f97a889c910 @landed_planes=[], @capacity=20>
2.2.3 :003 > weather = Weather.new
 => #<Weather:0x007f97a888eb58 @stormy=false>
2.2.3 :004 > plane = Plane.new
 => #<Plane:0x007f97a887f310 @flying=false>
2.2.3 :005 > weather.make_it_rain
 => true
2.2.3 :006 > airport.land(plane, weather)
RuntimeError: Unsuitable weather for landing!
	from /Users/asif/Desktop/makers/week-1/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):6
	from /Users/asif/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :007 > airport.take_off(plane, weather)
RuntimeError: Too stormy to take off!
	from /Users/asif/Desktop/makers/week-1/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):7
	from /Users/asif/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

### Maximum Capacity Features
	
	The airport class comes with a default capacity. This can be overridden by adding an argument when creating a new airport.

2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fbeca09f6d8 @landed_planes=[], @capacity=20>
2.2.3 :003 > airport2 = Airport.new(40)
 => #<Airport:0x007fbeca094710 @landed_planes=[], @capacity=40>
2.2.3 :004 > airport.capacity
 => 20
2.2.3 :005 > airport2.capacity
 => 40


2.2.3 :005 > 20.times { airport.land(plane, weather) }
 => 20
2.2.3 :006 > airport.capacity
 => 20
2.2.3 :007 > airport.land(plane, weather)
RuntimeError: No space for planes in airport
	from /Users/asif/Desktop/makers/week-1/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):7
	from /Users/asif/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

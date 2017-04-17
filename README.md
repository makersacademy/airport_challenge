This is a simple program to manage planes and airports.
The program introduces a random variable in the form
of storms which may or may not prevent landing and taking
off.
The airport capacity is set to 25 by default, but it
can be changed.

The program consist of 3 classes:
Airport
Plane
Weather

Here is an example on irb:
2.4.0 :001 > Dir[ __dir__ + '/lib/*.rb'].each {|file| require file}
 => ["./lib/airport.rb", "./lib/plane.rb", "./lib/weather.rb"]
2.4.0 :002 > ltn = Airport.new
 => #<Airport:0x007fb7641a6968 @ground_fleet=[], @weather=#<Weather:0x007fb7641a6918>, @capacity=25>
2.4.0 :003 > stn = Airport.new(1)
 => #<Airport:0x007fb76419ded0 @ground_fleet=[], @weather=#<Weather:0x007fb76419de80>, @capacity=1>
2.4.0 :004 > jet = Plane.new
 => #<Plane:0x007fb764195ff0 @status=0>
2.4.0 :005 > airbus = Plane.new
 => #<Plane:0x007fb76418d9e0 @status=0>
2.4.0 :006 > ltn.land(jet)
RuntimeError: No landing due to weather conditions.
	from /Users/unaimotriko/projects/weekend_challenges/airport_challenge/lib/airport.rb:20:in `land'
	from (irb):6
	from /Users/unaimotriko/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :007 > stn.land(jet)
 => [#<Plane:0x007fb764195ff0 @status=1>]
2.4.0 :008 > stn.land(airbus)
RuntimeError: Landing not possible, airport at full capacity
	from /Users/unaimotriko/projects/weekend_challenges/airport_challenge/lib/airport.rb:19:in `land'
	from (irb):8
	from /Users/unaimotriko/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :009 > ltn.take_off(jet)
RuntimeError: Plane not in this aiport
	from /Users/unaimotriko/projects/weekend_challenges/airport_challenge/lib/airport.rb:29:in `take_off'
	from (irb):9
	from /Users/unaimotriko/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :010 > stn.in_airport?(jet)
 => true
2.4.0 :011 > stn.take_off(jet)
 => #<Plane:0x007fb764195ff0 @status=0>
2.4.0 :012 > jet.on_air?
 => true
2.4.0 :013 >

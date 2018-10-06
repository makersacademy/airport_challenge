# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

###### Uninitialized constant Airport

airport = Airport.new
Traceback (most recent call last):
        2: from /Users/muge/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):2
NameError (uninitialized constant Airport)

###### Uninitialized constant Plane

2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fd2e8947448>
2.5.0 :003 > plane = Plane.new
Traceback (most recent call last):
        2: from /Users/muge/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NameError (uninitialized constant Plane)
2.5.0 :004 >

###### airport.land(plane) wrong number of arguments (given 1, expected)  )

2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fec639bedd8>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fec639b5c88>
2.5.0 :005 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/muge/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/muge/Projects/airport_challenge/lib/airport.rb:5:in `land'
ArgumentError (wrong number of arguments (given 1, expected 0))
2.5.0 :006 >

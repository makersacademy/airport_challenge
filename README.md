Airport Challenge:
=================

Makers Academy Week 1 Weekend Challenge
---------------------------------------

Creating a model for airplanes landing in and taking off from airport.

So far, it allows the user to:
- create airport and plane objects
- specify the airport's maximum capacity as well as list which planes are currently there (if this information is not provided by the user, it defaults to an empty airport with a capacity of 5)
- to instruct planes to land or take-off
- to display a list of planes currently at the airport
- to check whether a specific plane is currently at the airport
- to raise an error and prevent a plane from landing if an airport is already at or above its maximum capacity

Here is a demonstration of the features in IRB:
``` ruby
$ irb
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > require './lib/airport'
 => true 
2.6.5 :003 > airport = Airport.new
 => #<Airport:0x00007fe54ba38288 @planes=[], @capacity=5> 
2.6.5 :004 > plane = Plane.new
 => #<Plane:0x00007fe54ba4b518> 
2.6.5 :005 > airport.planes
 => [] 
2.6.5 :006 > airport.capacity
 => 5 
2.6.5 :007 > airport.at_airport?(plane)
 => false 
2.6.5 :008 > airport.land(plane)
 => "Plane landed" 
2.6.5 :009 > airport.at_airport?(plane)
 => true 
2.6.5 :010 > airport.planes
 => [#<Plane:0x00007fe54ba4b518>] 
2.6.5 :011 > airport.takeoff(plane)
 => "Plane taken off" 
2.6.5 :012 > airport.planes
 => [] 
2.6.5 :013 > airport.at_airport?(plane)
 => false 
2.6.5 :014 > other_airport = Airport.new([Plane.new], 1)
 => #<Airport:0x00007fe54f014910 @planes=[#<Plane:0x00007fe54f014960>], @capacity=1> 
2.6.5 :015 > other_airport.land(plane)
Traceback (most recent call last):
        6: from /Users/inbarvernia/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        5: from /Users/inbarvernia/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        4: from /Users/inbarvernia/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):19
        2: from (irb):19:in `rescue in irb_binding'
        1: from /Users/inbarvernia/Projects/airport_challenge/lib/airport.rb:10:in `land'
RuntimeError (Airport full; cannot land plane.)
2.6.5 :016 > quit
```
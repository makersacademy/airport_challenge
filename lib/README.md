#Airport challenge

Program allows us to permit planes to land or take off unless the weather conditions are stormy. It will not allow same plane to land twice at the airport or take off while not there. It will not allow plane to land while the airport is full. We can use default or custom capacity.

##How it works?
```irb
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > require './lib/plane.rb'
 => true
2.5.0 :003 > require './lib/weather.rb'
 => true
2.5.0 :004 > gatwick = Airport.new
 => #<Airport:0x00007f9d050554e8 @capacity=20, @weather=#<Weather:0x00007f9d050554c0>, @planes=[]>
2.5.0 :005 > luton = Airport.new(50)
 => #<Airport:0x00007f9d04990f40 @capacity=50, @weather=#<Weather:0x00007f9d04990f18>, @planes=[]>
2.5.0 :006 > luton.capacity
 => 50
2.5.0 :007 > gatwick.capacity
 => 20
2.5.0 :008 > gatwick.capacity = 30
 => 30
2.5.0 :009 > gatwick.capacity
 => 30
2.5.0 :010 > britishairways1 = Plane.new
 => #<Plane:0x00007f9d06030930>
2.5.0 :011 > britishairways105 = Plane.new
 => #<Plane:0x00007f9d05808d70>
2.5.0 :012 > britishairways105.land(luton)
 => [#<Plane:0x00007f9d05808d70>]
2.5.0 :013 > britishairways1.land(luton)
 => [#<Plane:0x00007f9d05808d70>, #<Plane:0x00007f9d06030930>]
2.5.0 :014 > luton.planes
 => [#<Plane:0x00007f9d05808d70>, #<Plane:0x00007f9d06030930>]
2.5.0 :015 > britishairways1.status(luton)
 => true
2.5.0 :016 > britishairways1.take_off(luton)
Traceback (most recent call last):
        3: from /Users/patryk/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):17
        1: from /Users/patryk/Projects/airport_challenge/lib/plane.rb:11:in `take_off'
RuntimeError (It is stormy)
2.5.0 :017 > britishairways1.take_off(luton)
 => #<Plane:0x00007f9d06030930>
2.5.0 :018 > britishairways1.status(luton)
 => false
2.5.0 :019 > britishairways1.land(gatwick)
 => [#<Plane:0x00007f9d06030930>]
2.5.0 :020 > britishairways1.status(gatwick)
 => true
```

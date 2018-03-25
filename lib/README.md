# Airport challenge

This is the program for the air traffic controllers.

## How it works?

### Airport

This is where most of the magic happens. Planes can land here or take_off from here.
We need to set the name for our airport or airports and set their capacity (20 planes by default).
It is pretty simple to do so:
```
2.4.1 :001 > gatwick = Airport.new(30)
 => #<Airport:0x007fcc8b8b7c48 @capacity=30, @weather=#<Weather:0x007fcc8b8b7c20>, @planes=[]>
2.4.1 :002 > luton = Airport.new(25)
 => #<Airport:0x007fcc8b8af5e8 @capacity=25, @weather=#<Weather:0x007fcc8b8af5c0>, @planes=[]>
2.4.1 :003 > stansted = Airport.new
 => #<Airport:0x007fcc8b8a7758 @capacity=20, @weather=#<Weather:0x007fcc8b8a7730>, @planes=[]>
```
In the example above We have created three airports with different capacities.
You can always check or change an airport capacity, and again It is pretty simple:
```
2.4.1 :004 > luton.capacity
 => 25
2.4.1 :005 > luton.capacity = 50
 => 50
2.4.1 :006 > luton.capacity
 => 50
```
Every airport will have It's own weather. We can always check is it stormy?
We do not want any planes starting or landing then do we?
```
2.4.1 :007 > luton.stormy?
 => true
2.4.1 :008 > gatwick.stormy?
 => true
2.4.1 :009 > stansted.stormy?
 => false
```
We can also check is it the airport already full or not to know can We let another plane land.
```
2.4.1 :010 > luton.full?
 => false
```
You can also check what planes are currently on the airport
```
2.4.1 :011 > luton.planes
 => [#<Plane:0x007fb51a110658>]
```


### Plane

I believe that dealing with planes is crucial in your job so this is How this program helps.
You just need to tell the program what is the name of the plane and It will know what to do with it.
```
2.4.1 :012 > ryanair1 = Plane.new
 => #<Plane:0x007fb51a110658>
2.4.1 :013 > ryanair2 = Plane.new
 => #<Plane:0x007fb51a1089f8>
2.4.1 :014 > ryanair3 = Plane.new
 => #<Plane:0x007fb51a100d98>
```
So We got some planes but what next? Lets land.
```
2.4.1 :015 >   ryanair1.land(luton)
 => [#<Plane:0x007fb51a110658>]
2.4.1 :016 > ryanair2.land(gatwick)
RuntimeError: It is stormy
	from /Users/patryk/Projects/airport_challenge/lib/plane.rb:5:in `land'
	from (irb):11
	from /Users/patryk/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :017 > ryanair1.land(luton)
RuntimeError: already landed
	from /Users/patryk/Projects/airport_challenge/lib/plane.rb:3:in `land'
	from (irb):13
	from /Users/patryk/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```
In the example above We have two errors. First because is stormy, and We cannot land a plane in those conditions second because We tried to land the same plane twice.
They will be helping you avoiding mistakes.
There is a third one below which stops us from landing planes on the full airport.
```
2.4.1 :018 > luton.capacity = 1
 => 1
2.4.1 :019 > ryanair3.land(luton)
RuntimeError: airport full
	from /Users/patryk/Projects/airport_challenge/lib/plane.rb:4:in `land'
	from (irb):16
	from /Users/patryk/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```
We do not want planes to just landing, we want them to take off as well.
Again it is pretty simple:
```
2.4.1 :020 > ryanair1.take_off(luton)
 => #<Plane:0x007fb51a110658>
2.4.1 :021 > ryanair1.take_off(luton)
RuntimeError: No such a plane at this airport
	from /Users/patryk/Projects/airport_challenge/lib/plane.rb:10:in `take_off'
	from (irb):18
	from /Users/patryk/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```
Another error! But not as scary as it looks, program simply will not let the plane start from the airport if It is not there/already started. Of course bad weather still applies and You cannot take off if It is stormy.
```
2.4.1 :022 > ryanair1.take_off(luton)
RuntimeError: It is stormy
	from /Users/patryk/Projects/airport_challenge/lib/plane.rb:11:in `take_off'
	from (irb):23
	from /Users/patryk/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```
Sometimes It gets busy and you want to check is the plane on the airport - no problem.
```
2.4.1 :023 > ryanair1.status(luton)
 => false
2.4.1 :024 > ryanair1.land(luton)
 => [#<Plane:0x007fb51a110658>]
2.4.1 :025 > ryanair1.status(luton)
 => true
```
## Feedback

Any suggestions welcome. Message me on github or email me at ppilecki@icloud.com

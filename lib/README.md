Airport Challenge
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Approach
-----
As the users are the airport controllers, I decided to let the airports control the coming and going of planes. Unfortunately, this also meant that when I thought I was completed, I realised I could make the planes land and takeoff, without having to be related to an airport.

I've fixed that by checking the plane controls - to ensure they have to initiated by an airport object for them to be acted upon.

irb

```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > gatwick = Airport.new
 => #<Airport:0x007fb781858f78 @capacity=50, @planes=[], @weather=#<Weather:0x007fb781858f00>>
2.2.3 :003 > heathrow = Airport.new 1
 => #<Airport:0x007fb7820835b8 @capacity=1, @planes=[], @weather=#<Weather:0x007fb782083518>>
2.2.3 :004 > plane1 = Plane.new
 => #<Plane:0x007fb782079db0 @on_ground=false>
2.2.3 :005 > plane2 = Plane.new
 => #<Plane:0x007fb782070710 @on_ground=false>
2.2.3 :006 > gatwick.land(plane1)
Landing succesful
 => true
2.2.3 :007 > plane1.to_land
RuntimeError: Cannot land without being instructed to
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/plane.rb:8:in `to_land'
	from (irb):7
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > heathrow.land(plane2)
Landing succesful
 => true
2.2.3 :009 > gatwick.take_off(plane1)
RuntimeError: Take-off is not allowed in stormy weather
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/airport.rb:25:in `take_off'
	from (irb):9
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :010 > gatwick.take_off(plane1)
Take-off was succesful
 => false
2.2.3 :011 > heathrow.land(plane2)
RuntimeError: Landing is not permitted as airport is full
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):11
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :012 > heathrow.take_off(plane1)
RuntimeError: Plane not at airport
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/airport.rb:26:in `take_off'
	from (irb):12
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :013 > heathrow.take_off(plane2)
Take-off was succesful
 => false
2.2.3 :014 > gatwick.land(plane2)
Landing succesful
 => true
2.2.3 :015 > gatwick.land(plane2)
RuntimeError: Plane already landed
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/plane.rb:9:in `to_land'
	from /Users/eirikwiig/Projects/Course/Week1/airport_challenge/lib/airport.rb:19:in `land'
	from (irb):15
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :016 > Task
NameError: uninitialized constant Task
	from (irb):16
	from /Users/eirikwiig/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```


Approach
-----
```
git clone git@github.com:eilw/airport_challenge.git
cd airport_challenge
gem install bundle
bundle
```

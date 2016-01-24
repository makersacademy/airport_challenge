Airport Challenge
=================

What is it?
---------

Airport challenge is an airport simulation program made in ruby using OOP and
BDD/TDD methodologies. The User story was the following:
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


Design Process
-------

I followed the BDD life cycle.
* First I isolated the different user stories, eg.:
  **So I can get passengers to a destination
  I want to instruct a plane to land at an airport and confirm that it has landed**
* I created the acceptance tests (or feature tests):
  **Airport, planes, weather**
* Then multiple unit tests for every acceptance test eg.:
  **Airport: inbound_planes, outbound_planes unit tests**
* And last the implementation:
  **class Airport end, class Plane end**


Build Process
-----

I tried using SOLID and encapsulation principles for this challenge to get into
the habit of proper programming.
A SOLID resource: https://subvisual.co/blog/posts/19-solid-principles-in-ruby

I made this challenge the TDD way, by writing the Rspec Unit test before my
actual code. I created the Unit tests the London way as DRY as i could, and the
final overall feature test using the Chicago way.

I made the weather functionality as a module with a Constant array which I
froze, hound dog suggested the .freeze method (doesn't allow further changes).
And i decided to make it a Module because it's a constant and can be reused in
many classes(or programs) if i wanted to.
A very helpful resource about ruby style guide from hound dog:
https://github.com/bbatsov/ruby-style-guide/


Example running this program on IRB
-----

```
2.3.0 :001 > require './lib/airport'
 => true
2.3.0 :002 > plane = Plane.new
 => #<Plane:0x007ff0389a5c60 @status="">
2.3.0 :003 > airport = Airport.new
 => #<Airport:0x007ff03893d0e8 @capacity=10, @planes=[]>
2.3.0 :004 > airport.land(plane)
 => [#<Plane:0x007ff0389a5c60 @status="landed">]
2.3.0 :005 > airport.land(plane)
RuntimeError: This plane has already been landed
	from /Users/alex/Desktop/Projects/airport_challenge/lib/airport.rb:43:in `pre_landing_checks'
	from /Users/alex/Desktop/Projects/airport_challenge/lib/airport.rb:20:in `land'
	from (irb):5
	from /Users/alex/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :006 > airport.planes
 => [#<Plane:0x007ff0389a5c60 @status="landed">]
2.3.0 :007 > airport.takeoff(plane)
 => #<Plane:0x007ff0389a5c60 @status="flying">
2.3.0 :008 > plane
 => #<Plane:0x007ff0389a5c60 @status="flying">
2.3.0 :009 > airport.planes
 => []
2.3.0 :010 > airport2 = Airport.new
 => #<Airport:0x007ff038987698 @capacity=10, @planes=[]>
2.3.0 :011 > airport2.land(plane)
 => [#<Plane:0x007ff0389a5c60 @status="landed">]
2.3.0 :012 > airport2.planes
 => [#<Plane:0x007ff0389a5c60 @status="landed">]
2.3.0 :013 > plane
 => #<Plane:0x007ff0389a5c60 @status="landed">
2.3.0 :014 > plane.status
 => "landed"
2.3.0 :015 > airport2.takeoff(plane)
RuntimeError: Can't takeoff, it's stormy!
	from /Users/alex/Desktop/Projects/airport_challenge/lib/airport.rb:35:in `pre_takeoff_checks'
	from /Users/alex/Desktop/Projects/airport_challenge/lib/airport.rb:26:in `takeoff'
	from (irb):15
	from /Users/alex/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :016 > airport2.planes
 => [#<Plane:0x007ff0389a5c60 @status="landed">]
2.3.0 :017 > airport2.takeoff(plane)
 => #<Plane:0x007ff0389a5c60 @status="flying">
2.3.0 :018 > airport2.planes
 => []
2.3.0 :019 >
```

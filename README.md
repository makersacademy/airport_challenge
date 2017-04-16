Week 1: Airport Challenge [![Build Status](https://travis-ci.org/chdezmar/airport_challenge.svg?branch=master)](https://travis-ci.org/chdezmar/airport_challenge)
=========================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o    |\_
          `~-.__       __..----..__                   )
                `---~~\___________/------------`````
                =  ===(_________)

```

Objective
---------
Creating a simple Air traffic controller

Topics covered
---------
- TDD, RSPEC, Git
- Unit and Feature tests
- Doubles, Stubbing
- Private methods



Irb transcripts
---------

The weather will be checked at the time that the plane is instructed to land or take off.

```
2.2.3 :063 > airport.land(plane)
RuntimeError: SERVICE ALERT! Airport activity cancelled due to storms
	from (irb):26:in `land'
	from (irb):63
	from /Users/Carlos/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
Feature testing:

```
2.2.3 :001 > require "./lib/airport.rb"
 => true 
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fad7a831628 @capacity=100, @planes=[]> 
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fad7a0a45b8 @capacity=500, @flying=true, @origin=nil, @destination=nil> 
2.2.3 :004 > airport.land(plane)
 => "Plane #<Plane:0x007fad7a0a45b8> landed successfully" 
2.2.3 :005 > airport.land(plane)
RuntimeError: ERROR! Plane already landed
	from /Users/Carlos/MakersAcademy/Week-1/airport_challenge/lib/airport.rb:26:in `land'
	from (irb):5
	from /Users/Carlos/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > plane
 => #<Plane:0x007fad7a0a45b8 @capacity=500, @flying=false, @origin="AMS", @destination=nil> 
2.2.3 :007 > airport
 => #<Airport:0x007fad7a831628 @capacity=100, @planes=[#<Plane:0x007fad7a0a45b8 @capacity=500, @flying=false, @origin="AMS", @destination=nil>]> 
2.2.3 :008 > airport.take_off(plane)
 => "Plane #<Plane:0x007fad7a0a45b8> took off successfully" 
2.2.3 :009 > plane
 => #<Plane:0x007fad7a0a45b8 @capacity=500, @flying=true, @origin="AMS", @destination=nil> 
2.2.3 :010 > plane.flying?
 => true 
2.2.3 :011 > airport.take_off(plane)
RuntimeError: Oops, there are no planes on the airport

```

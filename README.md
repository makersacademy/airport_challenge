The B-raw Airport
=================

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)

```
        ______
        _\____\___
=  = ==(__B-raw___)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
Introduction
-----

Ladies and Gentlemen - this is your captain speaking.

You've enjoyed the executive lounge.

You emptied the booze fridge of mini-champagnes and scoffed the pain au chocolats from the desk.

You have two copies of the free Financial Times in your bag (you don't even read that paper - why did you need to steal them?!) and grabbed a couple of mini-gins from the mini-bar.

You stumbled onto the plane and you are ready to take-off... or are you?

Get ready for the flight of your life, with the B-raw Aiport programme.

The Task (from original Maker's Academy repo)
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Your task is to test drive the creation of a set of classes/modules to satisfy all the above.

My Approach - Michael Barry
-----

There were few ways to approach this problem - and I have seen both being used.

Do the planes land at the airport, or does the airport land the planes? I think the former is more objectively correct, so I chose to give planes the command land and take-off, as opposed to the airport.

**Classes**

Plane - the largest class, with the take-off and land methods.

Airport - a small class that contains a landed_planes array and handles the stormy weather outcome.

Weather - contains a randomiser for determining a boolean outcome for whether there is a storm or not.

I'll go through some of our user stories now, with examples of feature testing code in irb:

**User Story One**
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport=Airport.new
 => #<Airport:0x007fcfe2829178 @landed_planes=[], @capacity=40, @stormy_weather=false>
2.2.3 :003 > plane=Plane.new
 => #<Plane:0x007fcfe2819b38>
2.2.3 :004 > plane.land airport
 => [#<Plane:0x007fcfe2819b38 @landed=true>]
2.2.3 :005 > plane.landed?
 => true
```
**User Story Two**
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport=Airport.new
 => #<Airport:0x007fc1ac851860 @landed_planes=[], @capacity=40, @stormy_weather=false>
2.2.3 :003 > plane=Plane.new
 => #<Plane:0x007fc1ac841e38>
2.2.3 :004 > plane.land airport
 => [#<Plane:0x007fc1ac841e38 @landed=true>]
2.2.3 :005 > plane.take_off airport
 => #<Plane:0x007fc1ac841e38 @landed=false>
2.2.3 :006 > plane.landed?
 => false
```
**User Story Three**
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
```
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fef5209fe40 @landed_planes=[], @capacity=40, @stormy_weather=true>
2.2.3 :005 > plane = Plane.new
 => #<Plane:0x007fef52097588>
2.2.3 :006 > plane.land airport
RuntimeError: Plane can't land when weather is stormy
```
**User Story Four**
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
2.2.3 :010 > airport = Airport.new
 => #<Airport:0x007fef5204e888 @landed_planes=[], @capacity=40, @stormy_weather=false>
2.2.3 :011 > 40.times do
2.2.3 :012 >     (Plane.new).land airport
2.2.3 :013?>   end
 => 40
2.2.3 :015 > airport
 => [#<Plane:0x007fef52026f90 @landed=true>, #<Plane:0x007fef52026f68 @landed=true>, #<Plane:0x007fef52026f18 @landed=true>, #<Plane:0x007fef52026ec8 @landed=true>, #<Plane:0x007fef52026e28 @landed=true>, #<Plane:0x007fef52026e00 @landed=true>, #<Plane:0x007fef52026d88 @landed=true>, #<Plane:0x007fef52026d38 @landed=true>, #<Plane:0x007fef52026d10 @landed=true>, #<Plane:0x007fef52026ce8 @landed=true>, #<Plane:0x007fef52026cc0 @landed=true>, #<Plane:0x007fef52026c98 @landed=true>, #<Plane:0x007fef52026c70 @landed=true>, #<Plane:0x007fef52026c48 @landed=true>, #<Plane:0x007fef52026c20 @landed=true>, #<Plane:0x007fef52026bf8 @landed=true>, #<Plane:0x007fef52026bd0 @landed=true>, #<Plane:0x007fef52026ba8 @landed=true>, #<Plane:0x007fef52026b58 @landed=true>, #<Plane:0x007fef52026b08 @landed=true>, #<Plane:0x007fef52026ae0 @landed=true>, #<Plane:0x007fef52026ab8 @landed=true>, #<Plane:0x007fef52026a90 @landed=true>, #<Plane:0x007fef52026a40 @landed=true>, #<Plane:0x007fef52026a18 @landed=true>, #<Plane:0x007fef520269f0 @landed=true>, #<Plane:0x007fef520269c8 @landed=true>, #<Plane:0x007fef52026978 @landed=true>, #<Plane:0x007fef52026950 @landed=true>, #<Plane:0x007fef52026928 @landed=true>, #<Plane:0x007fef52026900 @landed=true>, #<Plane:0x007fef520268d8 @landed=true>, #<Plane:0x007fef520268b0 @landed=true>, #<Plane:0x007fef52026888 @landed=true>, #<Plane:0x007fef52026860 @landed=true>, #<Plane:0x007fef52026838 @landed=true>, #<Plane:0x007fef52026810 @landed=true>, #<Plane:0x007fef520267e8 @landed=true>, #<Plane:0x007fef52026798 @landed=true>, #<Plane:0x007fef52026748 @landed=true>, #<Plane:0x007fef5394b138 @landed=true>]
2.2.3 :016 > Plane.new.land airport
RuntimeError: Airport is full
```
**User Story Five**
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
2.2.3 :002 > airport = Airport.new(2)
 => #<Airport:0x007ff68a933ba8 @landed_planes=[], @capacity=2, @stormy_weather=false>
 2.2.3 :004 > 3.times do; Plane.new.land airport; end
 2.2.3 :005 > Plane.new.land airport
RuntimeError: Airport is full

```

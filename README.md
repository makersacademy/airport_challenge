[![Build Status](https://travis-ci.org/catherinestevenson/airport_challenge.svg?branch=master)](https://travis-ci.org/catherinestevenson/airport_challenge)  [![Coverage Status](https://coveralls.io/repos/catherinestevenson/airport_challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/catherinestevenson/airport_challenge?branch=master)

Airport Challenge
=================

Week one weekend challenge at Makers Academy. My task is to test drive the creation of a set of classes/modules to satisfy all the user stories below.

Task
-----

A client wishes to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

## Technologies Used:

1. Ruby
2. RSpec
3. Github

## Approach I used:

I started by breaking down each user story and outlining possible classes and methods. I then experimented using irb to see how I would like classes/objects to interact with one another and what methods were required. Next, I took a test driven development approach and wrote each test first, watched it fail, made it pass and then refactored if needed.

## How the app works:

```
→ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fe1ba918248 @planes=[], @capacity=20>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007fe1ba920970 @flying=true>
2.2.3 :004 > airport.land(plane1)
 => [#<Plane:0x007fe1ba920970 @flying=true>]
2.2.3 :005 > plane1.landed?
 => false
2.2.3 :006 > plane1.land
 => false
2.2.3 :007 > plane1.landed?
 => true
2.2.3 :008 > airport.take_off(plane1)
RuntimeError: Stormy weather
	from /Users/catherinestevenson/Desktop/Projects/Week1/airport_challenge/lib/airport.rb:27:in `take_off'
	from (irb):8
	from /Users/catherinestevenson/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :009 > airport.take_off(plane1)
 => [#<Plane:0x007fe1ba920970 @flying=false>]
2.2.3 :010 > plane1.take_off
 => true
2.2.3 :011 > plane1.flying?
 => true
```

## Progress

App completed and all tests passing

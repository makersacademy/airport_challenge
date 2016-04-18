[![Build Status](https://travis-ci.org/wrumble/airport_challenge.svg?branch=master)](https://travis-ci.org/wrumble/airport_challenge)

Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
Version 1.0

This project contains three classes which do the following:

Airport class: Creates a new airport. Takes arrivals and departures whilst checking with the weather class if is safe to land. It can receive a capacity or reverts to a default of 20 planes. With this in mind it can refuse landing aircraft if it is full.

Plane class: Creates a new plane. Returns weather the plane is in the air or not via a @grounded variable.

Weather class: Returns to Airport class, true or false, if weather is stormy or not.

Example code:

2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fd1bc048d60 @landed_aircraft=[], @capacity=20>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fd1bc038e38>
2.2.3 :004 > airport.arrival(plane)
 => "Aircraft landed."
2.2.3 :005 > airport.departure(plane)
RuntimeError: Too stormy to take-off.
	from /Users/wrumble/Desktop/projects/airport_challenge/lib/airport.rb:25:in `departure'
	from (irb):5
	from /Users/wrumble/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > airport.departure(plane)
 => "Aircraft taken off."
2.2.3 :007 > plane.in_airport?
 => false
2.2.3 :008 > airport.arrival(plane)
RuntimeError: Too stormy to land.
	from /Users/wrumble/Desktop/projects/airport_challenge/lib/airport.rb:17:in `arrival'
	from (irb):8
	from /Users/wrumble/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :009 > airport.arrival(plane)
 => "Aircraft landed."
2.2.3 :010 > plane.in_airport?
 => true

The ask is written below. My method was methodical in approaching each user story as it came up whilst incorporating doubles during and not after(as a refactor) as it hindered with general progress. 

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

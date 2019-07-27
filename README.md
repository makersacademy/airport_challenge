## README

Simple program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

I used TDD to create this program. The next steps to be completed are to track planes (instance variables) to ensure that a plane that's already in the air can't takeoff, and a landed plane can't land.

### Getting started

Fork this repo, and clone to your local machine
Run the command gem install bundle
When the installation completes, run bundle

### Usage

In IRB, run require './lib/Airport'

### Code example, four planes landed then too stormy to land

2.5.0 :001 > require './lib/Airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007ffdea116e68 @weather=#<Weather:0x00007ffdea116e40>, @planes=[], @capacity=40>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007ffdea8dc300>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007ffdea8dc300>]
2.5.0 :005 > airport.land(plane)
 => [#<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>]
2.5.0 :006 > airport.land(plane)
 => [#<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>]
2.5.0 :007 > airport.land(plane)
 => [#<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>, #<Plane:0x00007ffdea8dc300>]
2.5.0 :008 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/jodifoster/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/jodifoster/Projects/airport_challenge/lib/Airport.rb:26:in `land'
RuntimeError (Too stormy to land)
2.5.0 :009 >



### Running tests

Use command 'rspec' to run tests

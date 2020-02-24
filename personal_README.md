# Title of project
AIRPORT CHALLENGE

## Getting started
To clone the project repo
`git clone git@github.com:Benjamaker/airport_challenge.git`

## Technologies
Ruby

## Project Goals
To practice TDD and Object Oriented programming principles by building a virtual airport.

## Running tests
#### Unit tests
Rspec
Run `rspec` from the command line to run unit tests
#### Feature tests
NB: UPDATE THE FILES AND ADD HERE
- First we open irb from the command line and `require './lib/airport.rb'` in order to run the program.
- Below we see a new instance of Airport and Plane class instantiated. Plane(s) will be instantiated as `@flying = true` as default, as this seems to be the case in our first user story.
- When we try to call `take_off(plane)` on the airport, we get `RuntimeError (Airport empty, there are no planes!)` because there are no planes at the airport yet.
- When we call `airport.land_plane(plane)` however, we see that the plane is returned and the status of `@flying = false`

```
Isabelles-Air:airport_challenge isabelleben$ irb
2.6.5 :001 > require './lib/airport.rb'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007ff11b10d038 @planes=[], @capacity=10, @weather=true>
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007ff11c01daf0 @flying=true>
2.6.5 :004 > airport.take_off(plane)
Traceback (most recent call last):
        5: from /Users/isabelleben/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/isabelleben/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/isabelleben/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from /Users/isabelleben/Projects/weekend-challenges/week1/airport_challenge/lib/airport.rb:29:in `take_off'
RuntimeError (Airport empty, there are no planes!)
2.6.5 :005 > airport.land_plane(plane)
 => [#<Plane:0x00007ff11c01daf0 @flying=false>]
```

## User stories
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

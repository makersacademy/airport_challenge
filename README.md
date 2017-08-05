[![Build Status](https://travis-ci.org/funmia/airport_challenge.svg?branch=master)](https://travis-ci.org/funmia/airport_challenge)


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
Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

```
All tests passing
100% Test coverage
Rubocop: no offences detected
```

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Follow the instructions below to run a feature test in irb ;

```
$ irb
2.4.0 :001 > require './lib/airport.rb'
 => true
2.4.0 :002 > require './lib/plane.rb'
 => false
2.4.0 :003 > require './lib/weather.rb'
 => false
2.4.0 :004 >
2.4.0 :005 >   airport = Airport.new
 => #<Airport:0x007fa1fd859b60 @weather=#<Weather:0x007fa1fd859b38 @number_generator=#<Random:0x007fa1fd859b10>>, @capacity=10, @planes=[]>
2.4.0 :006 > plane1 = Plane.new
 => #<Plane:0x007fa1fd851e88>
2.4.0 :007 > plane2 = Plane.new
 => #<Plane:0x007fa1fd84a340>
2.4.0 :008 > airport.land_plane(plane1)
 => [#<Plane:0x007fa1fd851e88>]
2.4.0 :009 > airport.land_plane(plane2)
 => [#<Plane:0x007fa1fd851e88>, #<Plane:0x007fa1fd84a340>]
2.4.0 :010 > airport.take_off(plane2)
RuntimeError: Error plane cannot fly in stormy weather
	from /Users/oluwafunmilayoadewodu/projects/airport_challenge/lib/airport.rb:23:in `take_off'
	from (irb):10
	from /Users/oluwafunmilayoadewodu/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :011 > airport
 => #<Airport:0x007fa1fd859b60 @weather=#<Weather:0x007fa1fd859b38 @number_generator=#<Random:0x007fa1fd859b10>>, @capacity=10, @planes=[#<Plane:0x007fa1fd851e88>, #<Plane:0x007fa1fd84a340>]>
```

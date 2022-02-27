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

Description
---------

The aim of this challenge is to build a software that controls the flow of planes at an airport. 
Planes can take off and land when the weather is not stormy and when the aiport capacity allows it.

Instructions to run the program
-------

1. The program can be run from the Terminal/Command Line
2. Ruby version 3.0.2 required. Installation details:
```shell
rvm install "ruby-3.0.2"
```
3. To run the program, use the following commands:
```shell
$ irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > require './lib/plane.rb'
 => true 
3.0.2 :003 > require './lib/weather.rb'
 => true 
```
4. Enjoy!

Output example with two planes and two airports
-------
```shell
| => irb
3.0. :001 > airport1 = Airport.new
 => #<Airport:0x00007fbb4fa7bb80 @capacity=100, @hangar=[], @weather=#<Weather:0x00007fbb4fa7bab8>> 
3.0.2 :002 > plane1 = Plane.new
 => #<Plane:0x00007fbb5094bf70 @grounded=false> 
3.0.2 :003 > plane2 = Plane.new
 => #<Plane:0x00007fbb4f96d4f0 @grounded=false> 
3.0.2 :004 > airport1.land(plane1)
/Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:51:in `land_check_list': Warning: stormy weather! Landing not allowed. (RuntimeError)
	from /Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):8:in `<main>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :005 > airport1.land(plane1)
 => [#<Plane:0x00007fbb5094bf70 @grounded=true>] 
3.0.2 :006 > airport1
 => 
#<Airport:0x00007fbb4fa7bb80
 @capacity=100,
 @hangar=[#<Plane:0x00007fbb5094bf70 @grounded=true>],
 @weather=#<Weather:0x00007fbb4fa7bab8>> 
3.0.2 :007 > airport1.land(plane2)
 => [#<Plane:0x00007fbb5094bf70 @grounded=true>, #<Plane:0x00007fbb4f96d4f0 @grounded=true>] 
3.0.2 :008 > airport1.take_off(plane1)
 => #<Plane:0x00007fbb5094bf70 @grounded=false> 
 3.0.2 :009 > airport1.take_off(plane1)
/Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:55:in `take_off_check_list': This plane has already taken off. (RuntimeError)
	from /Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):21:in `<main>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :010 > airport2 = Airport.new(50)
 => #<Airport:0x00007fbb53816cb0 @capacity=50, @hangar=[], @weather=#<Weather:0x00007fbb53816c88>> 
3.0.2 :010 > airport2.land(plane1)
 => [#<Plane:0x00007fbb5094bf70 @grounded=true>] 
3.0.2 :011 > airport1.take_off(plane1)
/Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:57:in `take_off_check_list': Warning: stormy weather! Takeoff not allowed. (RuntimeError)
	from /Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):19:in `<main>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :011 > airport1.take_off(plane2)
 => #<Plane:0x00007fbb4f96d4f0 @grounded=false> 
3.0.2 :012 > airport1.land(plane2)
/Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:48:in `land_check_list': This plane is already at this airport. (RuntimeError)
	from /Users/Valentina/Projects/makers_projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):25:in `<main>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

User stories used to build the software
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Software building process
-----
* Created airport_spec and started testing Airport class
* Created plane_spec and started testing Plane class
* Feature tested land method for Airport class, then proceeded with testing implementation in airport_spec
* Feature tested take_off method for Airport class, then proceeded with testing implementation in airport_spec
* Added test in plane_spec to check if plane left the airport
* Added exception: error message raised when airport is full (tested for one plane)
* Added default capacity (100) for airport and introduced ability to override it
* Created weather_spec and started testing Weather class
* Tested that take_off method raises error when weather is stormy
* Tested that land method raises error when weather is stormy
* Hedge case #1: added method to check if plane landed
* Hedge case #2: added error message for takeoff when plane already taken off
* Hedge case #3: added error message for landing when plane already landed at airport
* Hedge case #4: added error message for takeoff when plane not at the airport
* Hedge case#5: added error message for landing when plane already landed at other airport
* Created feature test to simulate flow of two planes to and from two different airports

Technologies used
-----
* Ruby
* Simplecov for testing coverage (test coverage: 99.29%)
* Rubocop for code style check

Future implementations to consider
-----
At the moment if the user changes the airport capacity for a number that is lower than the actual number of planes already at the airport, this doesn't raise any error. This needs to be fixed.


[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
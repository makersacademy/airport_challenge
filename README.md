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

Introduction
---------
The aim of this challenge was to put into practice all that was covered in week one of on-site training at Makers Academy. This was all completed with TDD in mind. I carried out feature tests and avoided edge cases in the time frame given although improvements can be made.

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
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

Usage
-----

You can interact with the program inside a REPL like irb;

Once irb has been loaded you will need to - require './spec/feature_spec.rb' - this will load all the necessary classes for use.

```
2.4.1 :001 > require './spec/feature_spec.rb'
 => true
2.4.1 :002 > plane = Plane.new
 => #<Plane:0x007fb3af0bad00>
2.4.1 :003 > airport = Airport.new
 => #<Airport:0x007fb3af0b2fd8 @airport=[], @weather=#<Weather:0x007fb3af0b2fb0>, @capacity=5>
2.4.1 :004 > airport.land(plane)
RuntimeError: Unable to land - stormy weather.
	from /Users/user/Projects//lib/airport.rb:18:in `land'
	from (irb):4
	from /Users/user/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :005 > airport.land(plane)
 => [#<Plane:0x007fb3af0bad00>]
2.4.1 :006 > airport.take_off(plane)
 => "#<Plane:0x007fb3af0bad00> no longer in airport."
```

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

A piece of code for managing airports, the planes they contain, and the weather.

Motivation
This project has been created as part of my journey as a junior developer at Makers Academy.

Features
Allows multiple airports to be created.
Allows multiple planes to be created.
Allows planes to be landed and taken off from airports.
Allows weather limits to be set for taking off and landing.
Randomised, probabilistic storms.
Airports can be checked for the planes they contain
Airports have maximum capacities (default 20), set at initialisation

How to use
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the programme on a REPL (irb r pry)

Requirements
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

Code example
-----

'''
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x00007ff92c021070 @capacity=20, @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007ff92d07de50 @flying=true>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x00007ff92d07de50 @flying=false>]
[5] pry(main)> airport.take_off(plane)
=> []

'''

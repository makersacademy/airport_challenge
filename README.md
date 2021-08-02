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
This is a Ruby program that controls the flow of planes at an airport. The planes can land and take off provided that the weather is not stormy. When it is stormy no planes can land or take off. This program was written using a test-driven development approach as part of a Makers Academy challenge. The user stories that informed this program can be seen below.

Prerequisites
---------

* You have installed Ruby

How to install
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

How to use this program
-------

The program has an Airport class, a Plane class and a Weather module. 

* By default, Airport instances start empty and accept a capacity argument ```airport = Airport.new(capacity)```
* Default capacity is set at 2 planes
* Plane instances accept true or false when initializing ```plane = Plane.new(true)```. True means the plane is instantiated as flying. False means the plane is instantiated as not flying. The default argument is true.
* The Weather module uses a random number generator and by default it generates stormy weather 20% of the time.

Here is an example of how to use the program:

```
~ irb
2.6.5 :001 > require "./lib/airport.rb"
 => true 
2.6.5 :002 > require "./lib/plane.rb"
 => true 
2.6.5 :003 > require "./lib/weather.rb"
 => true 
2.6.5 :004 > airport = Airport.new
 => #<Airport:0x00007fcec0a1aef0 @landed_planes=[], @capacity=2> 
2.6.5 :005 > plane = Plane.new
 => #<Plane:0x00007fcec0911248 @flying=true> 
2.6.5 :006 > airport.land(plane)
 => "#<Plane:0x00007fcec0911248> has landed successfully" 
2.6.5 :007 > plane.flying?
 => false 
2.6.5 :008 > airport.take_off(plane)
 => "#<Plane:0x00007fcec0911248> has taken off successfully" 
2.6.5 :009 > plane.flying?
 => true 
```

User stories
-------

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
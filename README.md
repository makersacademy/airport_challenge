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

Context
-----
This is first weekend challenge from Makers Academy, designed to test knowledge of TDD using Ruby and Rspec. 
The task was to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. 

Progress
-----
[![Build Status](https://travis-ci.org/rhiannonruth/airport_challenge.svg?branch=master)](https://travis-ci.org/rhiannonruth/airport_challenge)

Approach
-----

We were given the following user stories:

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

I approached this by creating classes for Plane and Airport and a module for Weather. I selected a module for Weather so that it did not need to be instantiated every time a method was called on Airport or Plane.

```
Class: Airport
Methods/State: capacity, planes, full, empty, plane_land, plane_take_off

Class: Plane
Methods/State: landed, land, takeoff,

Module: Weather
Methods/State: stormy?
```

Instructions
-----

$irb
2.2.3 :001 > require './lib/plane.rb'
 => true 
2.2.3 :002 > boeing_777 = Plane.new
 => #<Plane:0x007f7f548121a0 @landed=false> 
2.2.3 :003 > heathrow = Airport.new
 => #<Airport:0x007f7f538fc878 @planes=[], @capacity=20> 
2.2.3 :004 > boeing_777.land(heathrow)
 => "Plane successfully landed!" 
2.2.3 :005 > boeing_777.take_off(heathrow)
 => "Plane successfully taken off!" 
The B-raw Airport
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
-----

Ladies and Gentlemen - this is your captain speaking.

You've enjoyed the executive lounge.

You emptied the booze fridge of mini-champagnes and scoffed the pain au chocolats from the desk.

You have two copies of the free Financial Times in your bag (you don't even read that paper - why did you need to steal them?!) and grabbed a couple of mini-gins from the mini-bar.

You stumbled onto the plane and you are ready to take-off... or are you?

Get ready for the flight of your life, with the B-raw Aiport programme.

The Task (from original Maker's Academy repo)
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Your task is to test drive the creation of a set of classes/modules to satisfy all the above.

My Approach - Michael Barry
-----

There were few ways to approach this problem - and I have seen both being used.

Do the planes land at the airport, or does the airport land the planes? I think the former is more objectively correct, so I chose to give planes the command land and take-off, as opposed to the airport.

I'll go through some of our user stories now, with examples of feature testing code in irb:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport=Airport.new
 => #<Airport:0x007fcfe2829178 @landed_planes=[], @capacity=40, @stormy_weather=false>
2.2.3 :003 > plane=Plane.new
 => #<Plane:0x007fcfe2819b38>
2.2.3 :004 > plane.land airport
 => [#<Plane:0x007fcfe2819b38 @landed=true>]
2.2.3 :005 > plane.landed?
 => true
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

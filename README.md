# _Airport Challenge_

[![Build Status](https://travis-ci.org/benjamin-white/airport_challenge.svg?branch=master)](https://travis-ci.org/benjamin-white/airport_challenge)

Airport Challenge is a small **Ruby** Program to simulate the activities of planes and airports. It is comprised of the three classes contained in the **plane**, **airport** and **weather** files. The following user stories were provided by **Makers Academy** as a starting point for the program.

### User Stories


    As an air traffic controller
    So I can get passengers to a destination
    I want to instruct a plane to land at an airport and confirm that it     has landed

    As an air traffic controller
    So I can get passengers on the way to their destination
    I want to instruct a plane to take off from an airport and confirm     that it is no longer in the airport

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
    I would like a default airport capacity that can be overridden as     appropriate


### Domain Model

Objects  | Messages
------------- | -------------
Plane  | *landed*
  |  *flying*
Airport  | *land*
  |  *take_off*
  |  *full?*
Weather  |  *condition?*

### Program Overview

### Example Run In IRB
    irb(main):001:0> require './lib/airport'
    => true
    irb(main):002:0> gatwick = Airport.new(4)
    => #<Airport:0x00000600794ec8 @capacity=4, @planes=[], @today=#<Weather:0x00000600794e78>>
    irb(main):003:0> ryan_air = Plane.new('747')
    => #<Plane:0x0000060079cbf0 @flying=true, @id="747">
    irb(main):004:0> gatwick.land(ryan_air)
    => [#<Plane:0x0000060079cbf0 @flying=false, @id="747">]
    irb(main):005:0> gatwick.take_off
    => #<Plane:0x0000060079cbf0 @flying=true, @id="747">
    irb(main):006:0> gatwick.take_off
    RuntimeError: Unable to take off due to poor weather
    irb(main):007:0> gatwick.take_off
    RuntimeError: There are no planes in this airport
    irb(main):008:0> gatwick.land ryan_air
    => [#<Plane:0x0000060079cbf0 @flying=false, @id="747">]
    irb(main):009:0> gatwick.land ryan_air
    RuntimeError: Plane has already landed
    irb(main):010:0>


### Some Things I Struggled With

<br>
+ While it is mainly conceptual, I remained unsure whether the airport should begin with planes (the inverse being that all planes must start life in the air!). For reasons of practical application and as this is just a program (real planes begin life in a factory anyway right?) I choose to initialize an airport without planes.

+ Should we instruct a plane to land, or should an airport request that a plane lands? The ownership of these instructions determines where the #land and #take_off methods would be. After a little consideration I stuck with the initial domain model feeling control of these actions should reside with the airport.

+ Using mocks and stubs in test, choose not to expose properties for sake of testing alone.

### What I Will Do Next
+
+
+

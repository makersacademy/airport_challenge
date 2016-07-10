# _Airport Challenge_

[![Build Status](https://travis-ci.org/benjamin-white/airport_challenge.svg?branch=master)](https://travis-ci.org/benjamin-white/airport_challenge) &nbsp;&nbsp;[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)

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

The Airport class allows creation of an airport object. When first created this object will be given a default capacity of 20 (which can be over-riden by supplying an argument), an empty array to contain landed planes and an instance of the Weather object. The weather object provides a public method #stormy? which will randomly return true on occasion. Plane objects can be created with the new command and optionally be supplied with an id in the form of a string. Plane objects have one public attribute, 'flying'.

Airports offer two public methods in the form of *#land* and *#take_off*. Land requires a plane as an argument and if three guard conditions are passed it will set the plane's flying attribute to false and add the plane to its private array. The three conditions are that the airport is not full, the weather is not stormy and that the plane is not already in the airport. When *#take_off* is called and two guard conditions are passed it will set a plane's flying attribute to true and remove it from the planes array.

The airport offers a public method *#landed_planes* that will return the number of planes currently in the airport.

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

+ While it is mainly conceptual, I remained unsure whether the airport should begin with planes (the inverse being that all planes must start life in the air!). For reasons of practical application and as this is just a program (real planes begin life in a factory anyway right?) I choose to initialize an airport without planes.

+ Should we instruct a plane to land, or should an airport request that a plane lands? The ownership of these instructions determines where the *#land* and *#take_off* methods would be. After a little consideration I stuck with the initial domain model feeling control of these actions should reside with the airport.

+ Using doubles, mocks and stubs to support unit testing. I felt I had a knowledge shortfall when it came to writing **meaningful** and **succinct tests** for the program. At times being uncertain if I was testing what I intended and more broadly if there was validity in the test, ie. _'testing the obvious'_. A deeper understanding of the testing framework's **syntax** and **semantic structure** would also allow me to write less verbose tests with greater clarity when read back. One decision I believe was correct to make is that I did not expose properties for the sake of testing alone.

### What I Will Do Next
+ Read more on  domain models and see if my question regarding where a particular method should belong, could of been (or perhaps was) addressed at an earlier stage. This would benefit me by removing a potential roadblock from production in future projects.

+ Learn more about how to implement tests in Rspec, have a look also at Jasmine to see the solutions from a different angle (I find this occasional reframing beneficial before moving further). Definitely look further into how **doubles** and **mocking behaviour** could **DRY** out my tests and limit dependencies to ensure the unit being tested is isolated from contamination by unrelated code.

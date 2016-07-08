# _Airport Challenge_

[![Build Status](https://travis-ci.org/benjamin-white/airport_challenge.svg?branch=master)](https://travis-ci.org/benjamin-white/airport_challenge)

Airport Challenge is a small **Ruby** Program to simulate the activities of planes and airports. It is comprised of the three classes contained in the **planes**, **airports** and **weather** files. The following user stories were provided by **Makers Academy** as a starting point for the program.

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

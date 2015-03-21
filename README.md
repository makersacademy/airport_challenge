#Airport Challenge#
=================

[![Build Status](https://travis-ci.org/RBGeomaticsRob/airport_challenge.svg?branch=master)](https://travis-ci.org/RBGeomaticsRob/airport_challenge)

A coding challenge to create, in a test-driven style, a simple airport management system based on the user stories below:

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```
##Setup##

You will need to require the following to have the full functionality of the system.

##Classes and Methods##

Airport
  -arrival(*plane*)
  -departure(*plane*)
  -capacity

Plane
  -takeoff
  -land
  -airborne?


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
##Contribution##

This is a challenge set to identify progress in Wk1 at Makers Academy, therefore is designed to be tackled individually.

However comment on the quality of the code would be very welcome.


##Classes and Methods##

The system currently has the following structure:

Airport
- `arrival(plane)`
- `departure(plane)` - *Will default to next available plane, with no argument*
- `capacity`
- `stationed_planes`

Airport can recieve an argument of an options hash with key capacity to set capacity.

Plane
- `takeoff`
- `land`
- `airborne?`

Plane can recieve an argument of an options hash with key airborne to set the the status to true or false.


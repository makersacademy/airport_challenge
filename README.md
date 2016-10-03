Airport Challenge
=================

Travis CI status badge:
[![Build Status](https://travis-ci.org/LaszloBogacsi/airport_challenge.svg?branch=master)](https://travis-ci.org/LaszloBogacsi/airport_challenge)

Task unfinished: (functionality to add)

planning to add a plane tracking id to be able to instruct specific planes.
Need to add the option for planes to allow to belong to an airport
Need to add the option for planes to allow to be in the air only.
Set default variables for planes (landed, location) to meet the edge cases.

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Design Approach:
----------------

The main objects are 'airport', 'plane' and 'weather'.

=== airport ===
The 'airport' is able to handle and report 'takeoff' and 'landing' and also has a capacity attribute along the array of landed planes.
'airport' checks the weather condition before landing and takeoff to approve or reject the requests.
'airport's' capacity check will reject landing request when airport is full.


=== plane ===
The 'plane' object will have 3 attributes/states: 'grounded' / 'airborne' and a 'plane_id' to make every plane unique. (aircraft reg id).


=== weather ===
The 'weather' will have a random state of sunny/stormy.

=== user stories ===

1.
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

2.
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3.
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

4.
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

5.
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

6.
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate```

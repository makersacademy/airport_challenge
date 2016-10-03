Airport Challenge
=================
Makers Academy Weekend Challenge 1

=================

Created a program using the guidelines in the following User Stories in order to create a working airport that lands and takes off planes:

`As an air traffic controller
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
I would like a default airport capacity that can be overridden as appropriate`

How to use: require all files in ./lib and run tests.

I approached this using TDD. I did not manage to cover the user stories about the weather due to time constraints, however my airport class does take off and land planes and has maximum capacity. I approached the challenge using arrays to put the landed planes in, which helped to control their capacity.

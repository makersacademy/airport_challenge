Airport Challenge
=================
Author: Emma Beynon
Github: https://github.com/emmabeynon
Email: emma.beynon@gmail.com

This is my submission for the Makers Academy Week 1 Weekend Challenge: https://github.com/makersacademy/airport_challenge

Overview
---------
For this challenge I have been asked to write the software to control the flow of planes at an airport.  The user stories are as below:

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

How to run the programme
-------------------------
* Launch pry or irb
* Require './lib/airport.rb'
* airport = Airport.new => Creates an airport
* plane = Plane.new => Creates a plane

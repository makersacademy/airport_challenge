Airport Challenge
=================

This project controls the flow of planes in an airport, run from command line.


Motivation
---------

* Week 1 Weekend Challenge from Makers Academy
* Write the program through TDD


Features
-------

* Planes cannot land at airport if airport is full
* Guards against edge cases: 1) planes cannot land if the same plane is already at the airport and 2) planes cannot takeoff if the plane is not already at the airport
* Planes cannot land or takeoff if the weather is stormy
* The weather is random and weighted - there is a 1 in 10 chance of being stormy (chosen at random)


How to use?
-----

run irb in terminal: require './lib/airport.rb'

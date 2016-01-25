AIRPORT CHALLENGE
=================

- Author:       Alain Lemaire (jaxdid@gmail.com)
- Created on:   24/01/16 @ 06:10PM
- Last updated: 25/01/16 @ 05:02AM

***

Description
-----------
This project aims to create a basic airport and air traffic control management software. It is intended to provide the following core functionality:

* Planes should be able to land at an airport and confirm they have landed
* Planes should be able to take off from an airport and confirm they are no longer in the airport
* Prevent planes landing and take-off during stormy weather
* Prevent planes landing at "full" airports
* Set a default capacity for airports that can be overridden as needed

Instructions
------------
* Run the program by loading or requiring 'lib/airport.rb' in any REPL environment that supports Ruby (e.g., irb)
* Run Rspec tests by entering the `rspec` command in your command line interface.

Known Issues
------------
* Airports have an attribute accessor used to manually set weather conditions in order to pass Rspec tests. This should be replaced by use of Rspec doubles and mocking behavior to guarantee test-appropriate weather conditions. 
* Most edge cases have not been tested for or implemented, with the exception of `Plane#land` failing if not passed an `Airport` instance as an argument.
* Code has not been refactored due to time constraints.

External Sources
----------------
* Implementation of setting a default airport capacity and optional capacity override argument was borrowed from the Maker's Academy "Boris Bikes" solution for Challenge 17 (https://github.com/makersacademy/course/blob/master/boris_bikes/solutions/17.md).

Licensing
---------
Airport Challenge by Alain Lemaire is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
Based on a work at https://github.com/jaxdid/airport_challenge.

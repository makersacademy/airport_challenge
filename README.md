Airport Challenge
=================

About
-----
This program was created as a weekend challenge while at makersacademy. The program is designed to allow a flight traffic controller to land and takeoff planes within the capacity of an airport. It is also designed to track whether planes are flying or landed and also revoke the ability to land or takeoff in bad weather.

Languages
---------
This program was created using Ruby and the Rspec testing framework.

Install
-------

To install this program simply clone this repository from Github.

Basic Use
---------

To generate a new Airport or plane use the commands:

`airport = Airport.new`

`plane = Plane.new`

To land or takeoff a plane from a specific airport use the commands:

`airport.land(plane)`

`airport.takeoff(_plane)`

To check if it is too stormy to land or takeoff from a specific airport use:

`airport.stormy?`

Airport Challenge
=================

This is a program that allows an air traffic controller to manage the arrival and departing of aircraft from their airport and allows system designers to alter system attributes. It has the following objects with the listed capabilities:

1. Airport
  * Instruct a plane to take off.
  * Instruct a plane to land.
  * Prevent a plane from taking off.
  * Prevent a plane from landing.
  * Have a default capacity for landed planes.
  * Allow system designers to overwrite the default capacity of landed planes.
  * Return whether or not it's capacity is full.
  * Set a safety condition based on airport capacity and current weather conditions.
2. Plane
  * Can land at an airport.
  * Can take off from an airport.
  * Confirm it has landed at an airport.
  * Confirm it has taken off from an airport.
3. Weather
  * Can be sunny or stormy.

Development Methodology:
------------------------
This program was built using test driven development.

Language Used:
--------------
ruby 2.4.0p0 (2016-12-24 revision 57164)

Testing Framework Used:
-----------------------
rspec 3.5.4

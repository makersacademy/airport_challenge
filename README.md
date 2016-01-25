

Airport Challenge
=================

[![Build Status](https://travis-ci.org/katie210/airport_challenge.svg?branch=master)](https://travis-ci.org/katie210/airport_challenge)

* Purpose: To simulate an air traffic control tower

** How was this accomplished:

I emulated our Boris Bikes challenge basic functionality, enabling an Airport (array) to receive Plane elements as arguments, using the toggled statuses of has_landed and is_flying? to keep flight status straight.

** Weather is simulated through Random number generation upon each Airport isntance initialization.
There is a 20% chance for stormy weather, which toggles the @stormy method, and calls to ground the planes in case of bad weather.

The ground_planes method intends to halt all incoming and outgoing activity in its place.

[ONGOING ISSUES: RSPEC tests are failing due to randomization of weather -- still needs proper blocking]
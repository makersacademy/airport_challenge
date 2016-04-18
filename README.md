AUTHORS: Rahul Ramakrishna

What this repository contains
-----------------------------

This is my local repository for the Airports Challenge, forked from the Makers Academy repo of the same name.
The challenge has been presented to students in Week 1 of the Maker's Academy course.

The Challenge
-------------
The detailed challenge can be found in the README file located here:
https://github.com/makersacademy/airport_challenge/blob/master/README.md

Continuous Integration
----------------------
Travis CI has been used to test all stages of the build and the status can be seen here:
[![Build Status](https://travis-ci.org/rahulrama/airport_challenge.svg?branch=master)](https://travis-ci.org/rahulrama/airport_challenge)

Modules and classes used
------------------------
The solution makes use of the following classes and modules, each stored in a file of the same name:
- Airport (class)
  - land_plane (public method)
  - launch_plane (public method)
- Plane (class)
  - land (public method)
  - take_off (public method)
  - docked? (public method)
- Weather (module)
  - stormy? (method)
  - random_outlook (method)

Solution Explained
------------------
The following is a brief explanation of the solution:
- The weather is invoked through a module included in the airport class that generates a random  
  outlook based on a weekly forecast provided in an array
- The only methods used in the plane class is change the status of landed and are recalled using docked?
- 

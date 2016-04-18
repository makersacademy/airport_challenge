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
- The only methods used in the plane class change the status of landed and are recalled using docked?
- The airport class uses the functions land_plane and launch_plane to land and take_off a plane
  respectively. They call upon the weather module to check if it is safe to land or take-off prioring to
  providing permission to do so.
- The airport methods also check for the usual guard conditions including whether the airport is full,
  the plane is already docked or the plane is already airborne

Feature Test
------------
You can run the feature test from irb using the following steps:
- launch an irb terminal from the folder 'lib' in the airport challenge folder
- run 'ruby airport_feature_test.rb'
- the feature test is still work in progress and will be expanded upon later

Running the tests from a terminal window
----------------------------------------
As the feature test is still work in progress, thorough testing can be carried out using direct access from the
irb terminal, using the following steps (as a guideline):

[airport_challenge (master)]$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fb9f2841c60 @capacity=20, @docked_planes=[]>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fb9f20bcda0 @landed=false>
2.2.3 :004 > airport.land_plane(plane)
 => "The plane has successfully landed at the airport"

 The above example shows one of the methods (land_plane) available at the airport. For the sake of brevity, only
 one example will be shown and you can use the above as a guide to test out the rest of the airport functionality.
 Happy flying!

[![Build Status](https://travis-ci.org/LMCMLJ/airport_challenge.svg?branch=master)](https://travis-ci.org/LMCMLJ/airport_challenge)
[![Coverage
Status](https://coveralls.io/repos/github/LMCMLJ/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/LMCMLJ/airport_challenge?branch=master)
Airport Challenge
=================
Author: Michael Calvey
Date: Oct 1 2016

Description: This is a script that manages several operations of an airport.
Structurally, plane and airport instances are created from the defined classes.
All of the checks for takeoff and landing happen in the airport instance
automatically.

My approach to the challenge involved two parts. My airport class contains an
instance variable for flying, which is changed based on whether the plane is out
 of the airport. My airport class contains all landed planes, and all of the
 methods to land or takeoff new planes. It also contains a capacity for number
 of planes it can store.

How to use: require all of the files within './lib/' in irb and then instance as
 necessary.

Testing: All of the code was driven by tests, as can be found in ./spec/

TODO: none

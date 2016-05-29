# Airport Challenge
=================

[![Build Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

Makers Academy week 1 challenge testing TDD skills in Ruby and RSpec.

## User stories to domain model

Plane land 
- plane confirm landed
Plane take off 
- confirm not docked (airborne)

airport land plane
airport confirm plane landed (airport or plane?? perhaps a plane method)
airport release plane
airport confirm plane not docked (airport or plane??)
airport prevent takeoff if stormy
airport prevent landing if stormy
airport prevent landing if full
airport have default capacity that can be overriden

The weather needs to be generated at random numerically, but should be mostly sunny. Use a `rand` on a `range` between 1-10 and if number is less than 2 it equals "stormy".

## Classes

Two main classes for Plane and Airport, plus a Weather class for generating random weather to keep it seperate from the other classes.

## assumptions

- airport is empty at the beginning of the session
- a plane instance is airborne when created (i.e. approaching from another airport)
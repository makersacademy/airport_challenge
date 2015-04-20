[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

Airport Challenge
=================

The second program I built during my programming bootcamp at [Makers Academy](http://www.makersacademy.com/). 

Objective
---------

The objective was to build a system to control the flow of planes at an airport. Every plane must have a status indicating whether it's flying or landed. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories for this project:

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```

The technologies used include:

* [Capybara/RSpec]( https://github.com/jnicklas/capybara#using-capybara-with-rspec)
* [RSpec]( http://rspec.info/)
* [Rubocop](http://batsov.com/rubocop/)
* [Rake](https://github.com/ruby/rake)

How to use
--------------

* Fork and clone this repo
* Navigate to the cloned directory in terminal
* Fire up IRB: `$ irb`
* Require the files: `> require ‘./lib/airport.rb’` and `> require ‘./lib/plane.rb’`
* Create an airport and plane(s): `a = Airport.new` `p = Plane.new` 
* Call some methods:

| Airport             | Plane         |
|:-------------------:|:-------------:|
| .land (a plane)     | .land!        |
| .take_off (a plane) | .take         |


Planned updates
-----------------------

* 100% test coverage

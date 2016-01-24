Airport Challenge
=================

This is my week one Makers Academy weekend challenge.

The task was to develop a program to allow planes to land and take off from an airport while defending against inconsistent states and accounting for the weather.

Installation
-----

Clone the repo from github and cd into the directory.

Install bundle.

Load the app in irb.


Use
----

```
2.2.3 :001 > require './lib/airport.rb'
2.2.3 :002 > airport = Airport.new
2.2.3 :003 > plane = Plane.new
2.2.3 :004 > airport.land(plane)
2.2.3 :007 > airport.take_off(plane)
```

My Approach
-----

I created this using a test driven approach that included feature testing and unit testing. I would start with a failing feature test in irb that followed the user story. I would then create a unit test and write code that passed rspec.

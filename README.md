Airport Challenge
=================

My approach to solving the challenge
------------------------------------

* I wrote Plane class with two methods, land and takeoff. These methods call Airport methods receive and sendoff.
* I used guard conditions in Airport#receive and Airport#sendoff, to "close" the airport in the event of stormy weather.
* I used Plane attribute "location", to help prevent edge case scenarios, such as landing the same plane twice.
* Things to do next: - isolate tests, - consider the wisdom of receive and sendoff methods - write Rspec feature test

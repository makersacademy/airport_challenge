Airport Challenge
=================

```

  \----------------------------------\
   \                                  \        __
    \   Unicornelia                    \       | \
     >  Airport challenge               >------|  \       ______
    /   @Makers Academy - weekend task /       --- \_____/**|_|_\____  |
   /                                  /          \_______ --------- __>-}
  /----------------------------------/              /  \_____|_____/   |
                                                   *         |
                                                            {O}

       /*\       /*\       /*\       /*\       /*\       /*\       /*\
      |***|     |***|     |***|     |***|     |***|     |***|     |***|
       \*/       \*/ ____  \*/       \*/       \*/       \*/       \*/
        |         |  |  |   |         |         |         |         |
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

```

Progress
---------

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)


Description of the airport app
-------

A software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. The app has the following additional features:


* A plane to land at an airport (can also be confirmed)

* From the airport the plane can be instructed to take off (can also be confirmed)

* No takeoff or landing when the weather is stormy

* No landing when the airport is full

* The software can be used for many different airports, capacity of the airport can be modified


Completed tasks
-------

Features that are implemented:

 * Plane status
 * Plane landing
 * Plane takeoff
 * Full airport cannot land planes
 * Variable and default capacity
 * Errors raised for inconsistent actions

Future plans
----------

* Airport has to handle weather information and stop planes from taking off or landing when the weather is not sunny
* App should follow which planes took off and which landed
* Report on the status of the airport and number of planes it has
* Planes that landed cannot land again
* Planes that are flying cannot be at airport

For this mainly needed:
 - use test doubles
 - random number generator to set the weather
 - stub to override random weather to ensure consistent test behaviour


Snippet from the app:
----------

```
[unicornelia:...kend_task/airport_challenge]$ pry                                                                    (master✱)
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fb7d9b18990 @capacity=10, @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fb7d9ab8ab8>
[4] pry(main)> airport.receive_plane(plane)
=> [#<Plane:0x007fb7d9ab8ab8>]
[5] pry(main)> airport
=> #<Airport:0x007fb7d9b18990 @capacity=10, @planes=[#<Plane:0x007fb7d9ab8ab8>]>
[6] pry(main)> airport.take_off
=> #<Plane:0x007fb7d9ab8ab8>
[7] pry(main)> airport
=> #<Airport:0x007fb7d9b18990 @capacity=10, @planes=[]>
[8] pry(main)> airport.is_empty?
=> true
[9] pry(main)> airport.receive_plane(plane)
=> [#<Plane:0x007fb7d9ab8ab8>]
[10] pry(main)> airport.is_empty?
=> false
[11] pry(main)> airport.take_off
=> #<Plane:0x007fb7d9ab8ab8>
[12] pry(main)> airport.is_empty?
=> true
[13] pry(main)> airport.take_off
RuntimeError: The airport is empty, no planes to take off
from /Users/unicornelia/github/makers_course/weekend_task/airport_challenge/lib/airport.rb:21:in `take_off'
[14] pry(main)>

```

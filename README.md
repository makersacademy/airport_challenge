Airport Challenge
=================

````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o O o o o o O O o o o o o o O o  |\_
          `~-.__        ___..----..                  )
                `---~~\___________/------------`````
                =  ===(_________D

````

[![Build Status](https://travis-ci.org/seanhawkridge/airport_challenge.svg?branch=master)](https://travis-ci.org/seanhawkridge/airport_challenge)

My Approach
---------

My first step was to work through the user stories, isolate the objects and messages the program required, and put them in a table.

I then worked through the table step-by-step, aiming to write the whole program using TDD - first running a feature test in IRB, then writing a failing unit test in RSpec, then writing the classes and methods to pass the test, before moving on to the next set of failing tests. There were a few times when my code was passing the feature test, but not the unit test - on these occasions I had to refactor the unit tests to make sure everything was working and passing (I'm hoping this will improve as I learn RSpec syntax more thoroughly).

I chose to write Weather as a module rather than a class or method - partly because it seems more like a behaviour than a object, partly to make sure my Airport class adhered to the Single Responsibility Principle, and partly because I wanted to practice how to make, use and test Modules.

I aimed to write all the unit tests using mocks and stubs to ensure my tests were isolated within classes.

Once all the unit tests were passing, and I could run through a thorough feature test in IRB, I wrote an RSpec feature test to make sure the classes were interacting with each other properly. It was still necessary to stub in the radomised weather to make sure the tests passed properly with no unexpected storms.

The program can be run thoroughly in IRB/PRY:

```
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> gatwick = Airport.new
=> #<Airport:0x007fd992a94fc0 @capacity=25, @planes=[]>
[3] pry(main)> luton = Airport.new(3)
=> #<Airport:0x007fd992a56400 @capacity=3, @planes=[]>
[4] pry(main)> p1 = Plane.new
=> #<Plane:0x007fd992a168f0 @airborne=true>
[5] pry(main)> p2 = Plane.new
=> #<Plane:0x007fd9929c95f0 @airborne=true>
[6] pry(main)> p3 = Plane.new
=> #<Plane:0x007fd99304be28 @airborne=true>
[7] pry(main)> p4 = Plane.new
=> #<Plane:0x007fd993a26b50 @airborne=true>
[8] pry(main)> gatwick.land_plane(p1)
=> #<Airport:0x007fd992a94fc0
 @capacity=25,
 @planes=[#<Plane:0x007fd992a168f0 @airborne=false>]>
[9] pry(main)> gatwick.land_plane(p2)
=> #<Airport:0x007fd992a94fc0
 @capacity=25,
 @planes=
  [#<Plane:0x007fd992a168f0 @airborne=false>,
   #<Plane:0x007fd9929c95f0 @airborne=false>]>
[10] pry(main)> gatwick.send_plane(p2)
=> #<Airport:0x007fd992a94fc0
 @capacity=25,
 @planes=[#<Plane:0x007fd992a168f0 @airborne=false>]>
 [12] pry(main)> p2.airborne
=> true
[13] pry(main)> luton.send_plane(p2)
RuntimeError: That plane isn't in this airport
from /Users/seanhawkridge/Dropbox/Dev/airport_challenge/lib/airport.rb:28:in `send_plane'
[14] pry(main)> luton.planes
=> []
[15] pry(main)> gatwick.send_plane(p2)
RuntimeError: That plane isn't in this airport
from /Users/seanhawkridge/Dropbox/Dev/airport_challenge/lib/airport.rb:28:in `send_plane'
[16] pry(main)> gatwick.planes
=> [#<Plane:0x007fd992a168f0 @airborne=false>]
[17] pry(main)> luton.land_plane(p2)
=> #<Airport:0x007fd992a56400
 @capacity=3,
 @planes=[#<Plane:0x007fd9929c95f0 @airborne=false>]>
[18] pry(main)> luton.land_plane(p3)
=> #<Airport:0x007fd992a56400
 @capacity=3,
 @planes=
  [#<Plane:0x007fd9929c95f0 @airborne=false>,
   #<Plane:0x007fd99304be28 @airborne=false>]>
[19] pry(main)> luton.land_plane(p4)
=> #<Airport:0x007fd992a56400
 @capacity=3,
 @planes=
  [#<Plane:0x007fd9929c95f0 @airborne=false>,
   #<Plane:0x007fd99304be28 @airborne=false>,
   #<Plane:0x007fd993a26b50 @airborne=false>]>
[20] pry(main)> p1.airborne
=> false
[21] pry(main)> gatwick.send_plane(p1)
=> #<Airport:0x007fd992a94fc0 @capacity=25, @planes=[]>
[22] pry(main)> luton.land_plane(p1)
RuntimeError: The airport is full
from /Users/seanhawkridge/Dropbox/Dev/airport_challenge/lib/airport.rb:19:in `land_plane'
[23] pry(main)> luton.send_plane(p4)
=> #<Airport:0x007fd992a56400
 @capacity=3,
 @planes=
  [#<Plane:0x007fd9929c95f0 @airborne=false>,
   #<Plane:0x007fd99304be28 @airborne=false>]>
[24] pry(main)> luton.land_plane(p1)
=> #<Airport:0x007fd992a56400
 @capacity=3,
 @planes=
  [#<Plane:0x007fd9929c95f0 @airborne=false>,
   #<Plane:0x007fd99304be28 @airborne=false>,
   #<Plane:0x007fd992a168f0 @airborne=false>]>
[25] pry(main)> luton.stormy?
=> false
[26] pry(main)> luton.stormy?
=> false
[27] pry(main)> luton.stormy?
=> false
[28] pry(main)> luton.stormy?
=> false
[29] pry(main)> luton.stormy?
=> false
[30] pry(main)> luton.stormy?
=> false
[31] pry(main)> luton.stormy?
=> false
[32] pry(main)> luton.stormy?
=> false
[33] pry(main)> luton.stormy?
=> true
[34] pry(main)> luton.stormy?
=> false
[35] pry(main)>

```

Ideas / To do
---------

* Planes currently initialize in mid-air - it might make sense to refactor the code so that they initialize in an airport.
* It would be nice to give airports and planes `name` variables to make the IRB/PRY session clearer.

Notes
-------

The loops for testing random weather were inspired by Sir Rufus the Clever - https://github.com/rufusraghunath/

Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

This is a simulation controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. This is the Makers Academy homework challenge for week 1.

Objectives
---------

Learn object-oriented programming and test driven development


Technologies used
------------------

* Ruby
* Rspec
* Git

How to run it
---------------

```
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fa8c52a4ef8 @capacity=1, @planes=[], @weather=#<Weather:0x007fa8c52a4d90>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fa8c5245890 @landed=true>
[4] pry(main)> airport.land(plane)
RuntimeError: Too stormy to land
from /Users/chriscooper/Makers/week1/airport_challenge/lib/airport.rb:20:in `land'
[5] pry(main)> airport.land(plane)
RuntimeError: Too stormy to land
from /Users/chriscooper/Makers/week1/airport_challenge/lib/airport.rb:20:in `land'
[6] pry(main)> airport.land(plane)
=> [#<Plane:0x007fa8c5245890 @landed=true>]
[7] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fa8c5245890 @landed=false>
```

Features
---------

* Plane status
* Plane landing
* Plane takeoff
* Storms prevent landing
* Storms prevent takeoff
* Full airport cannot land planes
* Variable and default capacity
* Errors raised for inconsistent actions

Approach to solving
---------------------
1. Built Plane class which can take off and land
2. Built Airport class which is able to land planes, store them and let them take off
3. Gave Airport a capacity and allow to be overridden
4. Raised errors for edge cases
5. Built Weather class and gave Airport objects a random weather state
6. Raised errors for when weather is stormy
7. Refactored

This was built using a test driven approach using feature tests in pry and unit tests in Rspec.

The review.md file was used for hints when I got stuck and as a guide to refactoring my code.


Further work to do
---------------------
* Place limits on user changing capacity e.g. must be > 0 and can't be changed to below the number of planes currently in airport

* Write an RSpec feature test that land and takes off a number of planes

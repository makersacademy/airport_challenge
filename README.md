Airport Challenge [![Build Status](https://travis-ci.org/giamir/airport_challenge.svg?branch=master)](https://travis-ci.org/giamir/airport_challenge)
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Solution
---------
I solved this challenge creating 3 classes:

* Airport
* Plane
* Weather

### Airport class

> __This is the only class the user should use.__

These are the public messages you can send to an object Airport.

* **initialize(*opt* capacity)**
when you create an instance of airport you can specify a capacity otherwise it will be set to the constant DEFAULT_CAPACITY.

* **planes** it returns the array of planes stored in the airport. We should create a specific method to show the planes in the airport but for our aims we can accept this approximation.

* **capacity** it returns the maximum value of planes that the airport can hold.

* **generate_new_plane** create a new instance of Plane and store it in the airport. It returns the new instance of plane giving you the possibility to refer that with a variable.

* **land(plane)** it instructs a plane to land at the airport if the airport is not full, the plane is flying, the weather is not stormy. It returns the array of planes store in the airport.

* **take_off(plane)** it instructs a plane to take off from the airport if the plane is at the airport and the weather is not stormy. It returns the plane that took off.

### Plane class

> __This class should not be use by the user.__

These are the public messages you can send to an object Plane.

* **flying? *alias_method for flying*** it returns true if the plane is flying or false if is not.
* **land** it lands if the plane is flying
* **take_off** it takes off if the plane is not flying

### Weather class

> __This class should not be use by the user.__

These are the public messages you can send to an object Weather.

* **stormy?** it returns true 33% of times, false otherwise. It has been implemented with the *Kernel* method *rand*.


Example
--------
```
[1] pry(main)> pisa = Airport.new 2
=> #<Airport:0x007ff12c2f51f0 @capacity=2, @planes=[], @weather=#<Weather:0x007ff12c2f5178>>
[2] pry(main)> london = Airport.new
=> #<Airport:0x007ff12c2a6618 @capacity=10, @planes=[], @weather=#<Weather:0x007ff12c2a65c8>>
[3] pry(main)> plane1 = pisa.generate_new_plane
=> #<Plane:0x007ff12eaab000 @flying=false>
[4] pry(main)> pisa.planes
=> [#<Plane:0x007ff12eaab000 @flying=false>]
[5] pry(main)> plane2 = london.generate_new_plane
=> #<Plane:0x007ff12ea038a0 @flying=false>
[6] pry(main)> plane3 = london.generate_new_plane
=> #<Plane:0x007ff12e9c2eb8 @flying=false>
[7] pry(main)> london.planes
=> [#<Plane:0x007ff12ea038a0 @flying=false>, #<Plane:0x007ff12e9c2eb8 @flying=false>]
[8] pry(main)> london.take_off(plane2)
=> #<Plane:0x007ff12ea038a0 @flying=true>
[9] pry(main)> london.planes
=> [#<Plane:0x007ff12e9c2eb8 @flying=false>]
[10] pry(main)> pisa.land(plane2)
=> [#<Plane:0x007ff12eaab000 @flying=false>, #<Plane:0x007ff12ea038a0 @flying=false>]
[11] pry(main)> london.take_off(plane3)
RuntimeError: Unable to take off due to stormy weather
from /Users/giamirbuoncristiani/Projects/airport_challenge/lib/airport.rb:31:in `take_off'
[12] pry(main)> london.take_off(plane3)
=> #<Plane:0x007ff12e9c2eb8 @flying=true>
[13] pry(main)> london.planes
=> []
[14] pry(main)> pisa.land(plane3)
RuntimeError: Unable to land cause airport is full
from /Users/giamirbuoncristiani/Projects/airport_challenge/lib/airport.rb:23:in `land'
[15] pry(main)> pisa.take_off(plane3)
RuntimeError: Unable to instruct #<Plane:0x007ff12e9c2eb8> to take off cause is not in the airport
from /Users/giamirbuoncristiani/Projects/airport_challenge/lib/airport.rb:30:in `take_off'
[16] pry(main)> pisa.take_off(plane1)
=> #<Plane:0x007ff12eaab000 @flying=true>
[17] pry(main)> pisa.land(plane2)
RuntimeError: Unable to land cause is not flying
from /Users/giamirbuoncristiani/Projects/airport_challenge/lib/plane.rb:10:in `land'
```

Contributors
-------------
[Giamir Buoncristiani](https://github.com/giamir)

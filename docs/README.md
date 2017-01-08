README

Approach:
----------------------
Had trouble working out which methods to call on which objects, and how to link them where necessary (i.e. how to link a plane to an airport).
I ended up creating almost all the methods in the class Plane, passing it an argument which tells it which airport the instruction relates to.
Tackled the user stories in sequence, except for including a random weather generator; by default weather is currently clear;
the 'Plane' methods 'prevent_takeoff' and 'prevent_landing' raise an error if the 'stormy' variable of class 'Airport' is true,
and I use a stub to pass the appropriate value of 'stormy' into each test for clear or stormy weather.
Airport initialized with a default capacity of 5, but can be overridden by including a number as argument.


User stories| Domain models
----------------------

Plane
----------------------
plane  | (instruct to) land
plane  | status: landed

Plane
----------------------
plane  | (instruct to) take off
plane  | status: not in airport

Plane
----------------------
Stormy weather | Prevent takeoff

Plane
----------------------
Stormy weather | prevent landing

Plane
----------------------
Full airport | prevent landing

Plane
----------------------
Default airport capacity | Can be overridden

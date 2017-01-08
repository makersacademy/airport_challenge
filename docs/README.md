#README

> Approach:
----------------------
>Create domain models from user stories, one by one

>Create and fail tests for each domain model

>Write code to pass each test

>-planes - carry info about landing status; send messages to airport when landed; receive takeoff/land permission from airport

>-airports - carry capacity info; check weather info; receive plane info; send takeoff/land permit to planes based on weather, capacity

>-weather - contains random state (i.e. stormy? true/false)

>Had trouble working out which methods to call on which objects, and how to link them where necessary (i.e. how to link a plane to an airport).

>I ended up creating almost all the methods in the class Plane, passing it an argument which tells it which airport the instruction relates to.

>Tackled the user stories in sequence, except for including a random weather generator; by default weather is currently clear;

>the 'Plane' methods 'prevent_takeoff' and 'prevent_landing' raise an error if the 'stormy' variable of class 'Airport' is true,

>and I use a stub to pass the appropriate value of 'stormy' into each test for clear or stormy weather.

>Airport initialized with a default capacity of 5, but can be overridden by including a number as argument.


> User stories| Domain models
----------------------

Object | Action
-------|---------------
plane  | (instruct to) land
plane  | status: landed
plane  | (instruct to) take off
plane  | status: not in airport
Stormy weather | Prevent takeoff
Stormy weather | prevent landing
Full airport | prevent landing
Default airport capacity | Can be overridden

#####Test scopes:
>Plane 'landed'/'airborne' status

>Airports accept/refuse planes landing based on capacity

>Airports have default capacity which can be overridden

>Plane takeoff/landing in clear and stormy Weather

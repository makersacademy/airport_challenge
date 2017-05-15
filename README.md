Airport Challenge (by Kavita)
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

Instructions
---------
You can run this programme in irb.
```
$ irb
2.4.0 :001 > require './lib/airportcontrol'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fcb608fad30 @weather=#<Weather:0x007fcb608fad08>, @capacity=20, @hangar=[]>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fcb608f31e8 @status="airborne", @flight_number=1>

```
* To start, type
  `require './lib/airportcontrol'`
* You can create airports with
  `airport = Airport.new`
* You can create planes with
  `plane = Plane.new`
* An airport will be created with default capacity of 20:
  * You can specify a capacity instead:  `airport = Airport.new(50)`
  * Or you can override the default later: `airport.capacity = 100`
* Each airport has various functionalities:
  * Land airborne planes `airport.land_plane(plane)`
  * Takeoff grounded planes `airport.takeoff_plane(plane)`
  * Print flight no's of all planes in hangar `airport.check_hangar`
* Airports cannot land or takeoff planes during stormy weather. The weather
  is determined via a random number generator.
* The software might raise several different errors you should be aware of:
  * If you're trying to land a grounded plane
  * If you're trying to takeoff a plane already airborne
  * If you're landing planes when hangar is full
  * If plane you're taking off was landed at a different airport


Description
-----

 Software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Airports are created with a default capacity of 20 which can be overridden if required.  

 Here are the user stories that we worked out in collaboration with the client:

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

Programme defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

Steps Taken
-------

1. Using TDD to generate feature tests and unit tests, followed by writing code
   (using red-green-refactor process)
2. Writing additional tests to ensure programme defends against edge cases and
   refactoring accordingly
3. Isolating unit tests and stubbing behavior shared across no. of tests
4. Stub randomness of stormy weather generator to prevent random test failure
5. Refactoring code again to ensure compliance with SRP
6. Eliminate any redundant respond_to expectations
7. Implement additional functionality to programme (planes can return their flight
   number for clearer flight status messages, flight numbers of planes in hangar
   can be returned)

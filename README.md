Airport Challenge
=================

<a href= #task>TASK</a>  |  <a href= #edge>EDGE CASES</a>  |  <a href= #approach>APPROACH </a> | <a href= #tests> TESTS</a>

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
[Task](#task)
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

[Edge Cases / Extra features](#edge)
-----

- Inconsistent states of the system ensuring that planes can only take off from airports they are in.
- Planes that are already flying cannot takes off and/or be in an airport.
- Planes that are landed cannot land again and must be in an airport.
- Write an RSpec **feature** test that lands and takes off a number of planes

[Approach](#approach)
-----

- TDD for each method (some removed in later refactoring).
- OOD - Planes and Weather are detached entities from the airport. However, the majority if methods on the Airport class, including those that land or take-off as it seemed that what's really happening is the airport controlling flights with results impacting the airport not the plane.
- Refactoring & code cleanliness checks in process.

[Feature Tests](#tests)
-----

### SetUp

```
$ irb
2.5.0 :001 > require './lib/weather'
 => true
2.5.0 :002 > require './lib/airport'
 => true
2.5.0 :003 > require './lib/plane'
 => true
2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007f9bf3879060 @planes_in_airport=[], @capacity=100>
2.5.0 :005 > plane = Plane.new
 => #<Plane:0x00007f9bf3871310>
```

### Multiple Planes

_Possible in two actions:_
```
2.5.0 :006 > airport.confirm_landing(plane)
 => [#<Plane:0x00007f9bf3871310>]
2.5.0 :007 > airport.confirm_landing(plane2)
 => [#<Plane:0x00007f9bf3871310>, #<Plane:0x00007f9bf3869598>]
 ```

 _Or as array in one:_
 ```
 2.5.0 :006 > airport.confirm_take_off([plane, plane2])
 => "[#<Plane:0x00007f9bf3871310>, #<Plane:0x00007f9bf3869598>] has now left airport"
 ```

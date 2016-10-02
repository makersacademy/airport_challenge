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
Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
This was interpreted to mean that a Plane object would be required which would be able to land at an Airport object. This Plane would then be required to be stored in the Airport (in an array).
Testing looked something like:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fedf713e330>
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fedf712f3d0 @planes=[], @capacity=5, @weather=#<Weather:0x007fedf712f330 @conditions="sunny">>
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x007fedf713e330 @flying=false>]
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
This now required the Plane to be able to take off from the Airport and remove itself from the airports storage array.
Testing looked something like:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fedf713e330>
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fedf712f3d0 @planes=[], @capacity=5, @weather=#<Weather:0x007fedf712f330 @conditions="sunny">>
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x007fedf713e330 @flying=false>]
2.2.3 :006 > airport.take_off(plane)
 => []
2.2.3 :007 > airport
 => #<Airport:0x007fedf712f3d0 @planes=[], @capacity=5, @weather=#<Weather:0x007fedf712f330 @conditions="sunny">>
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
This required a new object of weather to prevent take off if the conditions were "stormy"
Testing looked something like:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fd032147a80>
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fd032137338 @planes=[], @capacity=5, @weather=#<Weather:0x007fd0321371a8 @conditions="stormy">>
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x007fd032147a80 @flying=false>]
2.2.3 :006 > airport.take_off(plane)
RuntimeError: Can't take off in stormy weather
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
This required the Plane to no longer take off in "stormy" conditions.
Testing looked something like this:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007ff55213ef08>
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007ff55212f058 @planes=[], @capacity=5, @weather=#<Weather:0x007ff55212ef40 @conditions="stormy">>
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x007ff55213ef08 @flying=false>]
2.2.3 :006 > airport.take_off(plane)
RuntimeError: Can't take off in stormy weather
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
This required a new method of capacity to be applied to the Airport object and not allow the storage array to not accept more Planes than that specified capacity.
Testing looked something like this:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > airport = Airport.new
 => #<Airport:0x007fd840947530 @planes=[], @capacity=1, @weather=#<Weather:0x007fd840947378 @conditions="stormy">>
2.2.3 :004 > airport.land(Plane.new)
 => [#<Plane:0x007fd8409359e8 @flying=false>]
2.2.3 :005 > airport.land(Plane.new)
RuntimeError: Airport is at capacity
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
This required a default capacity to be specified on instantiation of the Airport.
Testing looked something like:
```
2.2.3 :001 > require './lib/plane'
 => true
2.2.3 :002 > require './lib/airport'
 => true
2.2.3 :003 > airport = Airport.new 20
 => #<Airport:0x007fe7200145a0 @planes=[], @capacity=20
```

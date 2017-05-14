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

Instructions
---------

* To run this program in irb ensure you first require the airtraffic.rb file

```
2.4.0 :001 > require './lib/airtraffic.rb'
 => true
2.4.0 :002 > plane = Plane.new
 => #<Plane:0x007f8b58885f78>
2.4.0 :003 > airport = Airport.new
 => #<Airport:0x007f8b5887e200 @planes=[], @capacity=2>
2.4.0 :004 >
```

Description
-------

* This programme does the following functionality
1. Planes can land and take off from an airport giving confirmation messages after this has happened
2. There is a safety mechanism to ensure planes are unable to land or take off if it is storm
3. There is a fixed capacity for planes
4. This capacity can be increased

* Based on these user stories
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

This task has been completed with using TDD to satisfy all the above user stories. The weather uses a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy).

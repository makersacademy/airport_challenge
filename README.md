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

** A simple Air Traffic controller built to do the following user stories **

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

```
```
*** A demonstration of User Story #1 ***


[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f81f8a31840 @capacity=[]>
[3] pry(main)> plane1 = Plane.new
=> #<Plane:0x007f81fa824690>
[4] pry(main)> plane2 = Plane.new
=> #<Plane:0x007f81fa80c068>
[5] pry(main)> airport.land(plane1)
=> "You have landed plane: #<Plane:0x007f81fa824690>"
[6] pry(main)> airport.land(plane2)
=> "You have landed plane: #<Plane:0x007f81fa80c068>"
[7] pry(main)> airport
=> #<Airport:0x007f81f8a31840
 @capacity=[#<Plane:0x007f81fa824690>, #<Plane:0x007f81fa80c068>]>

```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
```
*** A demonstration of User Story #2 ***

[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fd941928ed0 @capacity=[]>
[3] pry(main)> plane1 = Plane.new
=> #<Plane:0x007fd941a61590>
[4] pry(main)> plane2 = Plane.new
=> #<Plane:0x007fd9423779e0>
[5] pry(main)> airport.land(plane1)
=> "You have landed plane: #<Plane:0x007fd941a61590>"
[6] pry(main)> airport.land(plane2)
=> "You have landed plane: #<Plane:0x007fd9423779e0>"
[7] pry(main)> airport
=> #<Airport:0x007fd941928ed0
 @capacity=[#<Plane:0x007fd941a61590>, #<Plane:0x007fd9423779e0>]>
[8] pry(main)> airport.take_off
=> "The flight now leaving is: #<Plane:0x007fd9423779e0>"
[9] pry(main)> airport
=> #<Airport:0x007fd941928ed0 @capacity=[#<Plane:0x007fd941a61590>]>

```
```
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

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

---------

This software controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. If maximum capacity is reached, then no more planes can land. The default capacity can be changed by the user.

## User stories ##

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

## How to run the program ##
To run the programme, please open ```irb``` in your terminal use the following syntax:

```
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fb01d066ad8 @capacity=1, @planes=[], @weather=#<Weather:0x007fb01d066ab0>>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fb01d055940>
2.4.0 :004 > airport.land(plane)
 => [#<Plane:0x007fb01d055940>]
 ```
To land a plane please use:

```
2.4.0 :004 > airport.land(plane)
 => [#<Plane:0x007fb01d055940>]
 ```
 To make a plane takeoff:

 ```
 2.4.0 :006 > airport.take_off
 ```
 To change the default capacity:

 ```
 2.4.0 :008 > airport.capacity=123
 => 123
 ```


## How to run the tests ##
To run the tests, use the following command in your terminal from within the 'airport_challenge' directory:

```
rspec
```

## Authors ##
Costas Kiteou

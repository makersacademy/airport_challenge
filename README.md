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

There is a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  The following user stories were created:

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
Sum of the program
-----

* This ruby program can create airports and planes with optional customised names.
* A plane can land from the air to an airport if the weather is not stormy and the airport still has capacity
* Once a plane landed it confirms it
* If a plane can't land it prints an error message containing the issue
* A plane can take off from an airport to the air if the weather is not stormy
* Once a plane took off it confirms it
* If a plane can't take off it prints an error message containing the issue
* A plane keeps track of it's current location
* An airport keeps track of the planes currently in it
* An airport's capacity can be manually changed (default capacity is 10)
* Weather is generated randomly

```
Land:
*PLANE IN THE AIR* -- land { checks weather for storm & airport capacity } --> *PLANE IN THE AIRPORT*
Take off:
*PLANE IN THE AIRPORT* -- take off { checks weather for storm } --> *PLANE IN THE AIR*
```


How the code is used
-----

```
[1] pry(main)> require "./lib/airport.rb"
=> true
[2] pry(main)> # create new airports with a capacity of 10
[3] pry(main)> ldn = Airport.new("LDN")
=> #<Airport:0x007ff81aa216a0 @capacity=10, @name=:LDN, @planes_in_airport=[]>
[4] pry(main)> # change capacity of the airport
[5] pry(main)> ldn.change_capacity(20)
=> 20
[6] pry(main)> ldn
=> #<Airport:0x007ff81aa216a0 @capacity=20, @name=:LDN, @planes_in_airport=[]>
[7] pry(main)> # create planes and keep track of their location
[8] pry(main)> airbus = Plane.new("Airbus")
=> #<Plane:0x007ff81b829ef0 @location=:up_in_the_air, @name=:Airbus>
[9] pry(main)> # land planes to the airport
[10] pry(main)> ldn.land(airbus)
The Airbus landed succesfully=> nil
[11] pry(main)> ldn
=> #<Airport:0x007ff81aa216a0 @capacity=20, @name=:LDN, @planes_in_airport=[:Airbus]>
[12] pry(main)> airbus
=> #<Plane:0x007ff81b829ef0 @location=:LDN, @name=:Airbus>
[13] pry(main)> # take off planes from the airport
[14] pry(main)> ldn.take_off(airbus)
The Airbus took off succesfully=> nil
[15] pry(main)> ldn
=> #<Airport:0x007ff81aa216a0 @capacity=20, @name=:LDN, @planes_in_airport=[]>
[16] pry(main)> airbus
=> #<Plane:0x007ff81b829ef0 @location=:up_in_the_air, @name=:Airbus>
[17] pry(main)> # check the weather forecast for the airport for landing / taking off
[18] pry(main)> ldn.weather_forecast
Clear=> nil
```

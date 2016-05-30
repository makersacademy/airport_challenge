Makers Academy Weekend Challenge 1
================
Currently not able to fulfil all of the clients requirements. The weather having an impact on take off and landing still needs to be implemented.


'''''''
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> require './lib/plane'
=> true
[3] pry(main)> airport = Airport.new
=> #<Airport:0x007fa460b596e8 @capacity=20, @planes=[]>
[4] pry(main)> plane = Plane.new
=> #<Plane:0x007fa460b1a218 @flying=true>
[5] pry(main)> plane2 = Plane.new
=> #<Plane:0x007fa460ae9208 @flying=true>
[6] pry(main)> airport.land(plane)
=> [#<Plane:0x007fa460b1a218 @flying=true>]
[7] pry(main)> airport.land(plane2)
=> [#<Plane:0x007fa460b1a218 @flying=true>, #<Plane:0x007fa460ae9208 @flying=true>]
[8] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fa460ae9208 @flying=true>
[9] pry(main)> airport
=> #<Airport:0x007fa460b596e8 @capacity=20, @planes=[#<Plane:0x007fa460b1a218 @flying=true>]>
[10] pry(main)> airport.take_off(plane2)
=> #<Plane:0x007fa460b1a218 @flying=true>
[11] pry(main)> airport
=> #<Airport:0x007fa460b596e8 @capacity=20, @planes=[]>
'''''''

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
=================

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

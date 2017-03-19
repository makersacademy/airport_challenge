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

Transcript example
------------------

Type in Pry or Irb:  
  
```
$ require  
[1] pry(main)> require "./lib/airport"
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fd1d2169580 @capacity=2, @landed_planes=[], @planes=[], @weather=nil>
[3] pry(main)> airfrance = Plane.new
=> #<Plane:0x007fd1d0938f10>
[4] pry(main)> airport.land(airfrance)
=> [#<Plane:0x007fd1d0938f10>]
[5] pry(main)> airport.confirm_landing(airfrance)
=> [#<Plane:0x007fd1d0938f10>]
[6] pry(main)> airport.plane_status
Number of Planes: [#<Plane:0x007fd1d0938f10>], 1 total.
Planes on ground: [#<Plane:0x007fd1d0938f10>], 1 total.
[7] pry(main)> easyjet = Plane.new
=> #<Plane:0x007fd1d085fc10>
[8] pry(main)> airport.land(easyjet)
RuntimeError: Landing denied, weather report stormy
```

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

Introduction
---------
Weekend challenge for week 1 at Makers Academy.

Task was to write software to control the flow of planes through an airport.  The software was written to meet the following user stories:

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

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Require the directory in IRB.  

In IRB
-------
2.4.0 :001 > require './lib/airport'  
 => true  
2.4.0 :002 > gatwick = Airport.new  
 => #<Airport:0x007fba3a825a18 @capacity=20, @planes=[]>  
2.4.0 :003 > biggles = Plane.new  
 => #<Plane:0x007fba3b152d20 @flying=true>  
2.4.0 :004 > biggles.flying?  
 => true  
2.4.0 :005 > ginger = Plane.new  
 => #<Plane:0x007fba3b140d50 @flying=true>  
2.4.0 :006 > ginger.flying?  
 => true  
2.4.0 :007 > gatwick.land(biggles)  
 => [#<Plane:0x007fba3b152d20 @flying=false>]  
2.4.0 :008 > gatwick.land(ginger)  
 => [#<Plane:0x007fba3b152d20 @flying=false>, #<Plane:0x007fba3b140d50 @flying=false>]  
2.4.0 :09 > gatwick.launch(biggles)  
 => #<Plane:0x007fba3b152d20 @flying=true>  
 2.4.0 :010 > gatwick.launch(biggles)  
 RuntimeError: That plane is not here  
 2.4.0 :011 > gatwick.land(biggles)  
 => [#<Plane:0x007fba3b140d50 @flying=false>, #<Plane:0x007fba3b152d20 @flying=false>]  

and so on!  

Introduction
---------
This repo contains the code I wrote for the Airport Challenge, the Makers Academy Week 1 end-of-week challenge. This involved creating basic software to control the flow of planes at an airport given the following six user stories:
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Instructions for use
---------
### To setup in irb:
1) Initiate irb in a terminal
2) Require atc.rb, e.g. enter 'require "./lib/atc.rb"' into the terminal (note: "atc" stands for "air traffic control")
3) For testing purposes, enter 'atc_test' into the terminal. This will create an iteration of the AirTrafficControl class named 'atc'. It will also create x3 Plane iterations named 'plane1', 'plane2' and 'plane3'. An Airport iteration will also be automatically assigned to the new atc object
4) When entering 'atc_test', you can also specify an airport capacity, e.g. 'atc_test(40)' will setup the atc iteration and give its associated Airport a capacity of 40

### Controlling plane flow from atc:
1) Use **atc.order_land(plane)** to make a plane land, provided conditions are good (e.g. entering 'atc.order_land(plane1)' will force the plane1 object to land in atc's airport)
2) Use **atc.order_launch(plane)** to make a plane take off, provided conditions are good
3) Use **atc.new_plane** to generate a new Plane iteraion and add it to the list of planes being tracked by the atc (note: you may wish to assign any new planes a variable, e.g. 'plane4 = atc.new_plane' so they can be manipulated with the orders mentioned above. Alternatively, you can access the full list of tracked planes with **atc.planes**)
4) Use **atc.override_airport_capacity(number)** to set the capacity of the atc's associated airport (e.g. 'atc.override_airport_capacity(50)')

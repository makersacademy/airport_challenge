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

My approach
---------
I began by diagramming the different classes and interacting methods that would be required. I resolved to create the following 4 classes: AirTrafficControl, Airport, Plane and WeatherReport. Please note:
1) I decided to generate random weather by creating new iterations of a WeatherReport object, which randomly generated weather on initiation. I decided this would be useful as it would allow room for future development (for example, WeatherReports could be stored as records, or a time stamp could be attached to them)
2) I decided to create a separate AirTrafficControl class so that all user methods could be centralised in one class, and so that planes could be tracked outside of the Airport class. In hindsight, this may have been more complicated than this task required, but it makes sense to me to have this separate from the Airport class

Once the diagram was created, I developed each of the classes with a test-driven development approach, writing tests and creating methods that would pass these tests.

All six user stories have been addressed (see Instructions for use below).

I looked into using stubs throughout the testing suites to replace the new classes I created, but given the amount of checks I implemented in methods to ensure the correct class object was being passed as an argument, this become impractical. Given more time, I would have tried to implement this properly. As it is, only airport_spec.rb uses stubs, and not a lot.

With more time, I would also like to tidy up the return values of each method so that they display neatly in irb.

Total rspec testing coverage: 100%; 40 rspec tests; rubocop passed with no offences.



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

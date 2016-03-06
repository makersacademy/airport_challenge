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



This weekend challenge addresses the following User Stories provided by Makers Academy. The forked repository is used by permission of Makers Academy.

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
INSTRUCTIONS:
The Air Traffic Controller runs the app from a central location.  Through it, he or she is able to manage the traffic in and out of several airports.  Basic steps include:

* An airport to created.
* Planes are created and are initialized without a status and are not in any airport.
* As planes generally reach airports only by landing at them, airplanes must be landed first to be added to an airport's plane roster (an array).
* The app has logic that prevents takeoff and land commands for being executed if the weather is inclement at the airport at the time of the command.
* Airports are unable to receive planes for whom it current status is unknown or if the airport is full.  
* The ATC can alter the capacity of an airport.

REMAINING WORK FOR FIRST RELEASE:

This release should be considered an alpha release.  It requires additional work including:

* additional testing of edge cases.
* the addition of flight tracking to ensure that departing flights have a destination and that destination airport is the only one at which the plane can land.
* refactoring spec files, particularly airport_spec.rb.
* and, finally, a walkthrough of the code with my mentor to analyze it for style, elegance and best practices. 

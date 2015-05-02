Airport Challenge
=================

Original Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```

Approach
-----

Developed an airport centric system where two primary method interfaces (land and release) control the movement of planes. This is because the tasks across all stakeholder use cases involved a key action from the airport destination.
IRB has been assumed as the user interface for pilots and air traffic controllers.  

Plane objects are tracked through their 'flying' status which is toggled between true and false by the airport's land and release methods.

Weather volatility is introduced through the random weather change method which uses a random number generator (rand(2)) to control the 'stormy' attribute in the airport.

The testing suite has adopted one core feature test utilising stubs to check weather 6 planes are able to land and take off during non-stormy condtions. 
Unit testing on the airport then adds the context of stormy conditions which raise errors when trying to land or take-off.
Plane unit tests ensure that the flying attribute changes correctly before and after take-off.


Outstanding Issues
-----

* The program works fully in IRB and at feature test level but the two unit tests checking expected actions in stormy weather are currently failing due to an undefined singleton class error >> this is being further explored


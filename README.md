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
This project was my first weekend challenge at Maker's Academy, after spending a week working on the basics of TDD.


Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

In my approach to this task, I decided that I would need three classes. One for Airport (which would have methods to land and take off with planes as parameters) one for Plane and one for Weather. I created an array for each airport to store the planes, which would be removed and added by take off/land.

The weather class was given an attribute of 'stormy' which was initialised as false, but could change after each time a plane landed or took off. I accomplished this with an automatically called method that used rand to give a 1 in 6 chance of returning stormy weather. Planes are unable to land or take off when the weather is stormy due to a fail mechanism in the corresponding methods.

To keep track of planes, the land and take off methods check that the plane passed is grounded or flying respectively, using an attribute of the Plane class named 'flying'. An error is also raised if a plane tries to take off from an airport where it isn't parked.

A default capacity was set for each airport as 20, but this can be altered as an attr_accessor was added for capacity.

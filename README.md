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

User stories
---------

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
 ***Approach***

 From the user stories there should be two classes of objects; Airports and Planes.

 They have the following responsibilities and attributes

 Airports

 Airports are responsible for;
 - knowing what planes it currently has on the ground.  
 - telling planes whether they can land or take off based on weather and capacity
 - checking if it's current weather is stormy or not (and randomly assigning storms)
 - knowing it's capacity, knowing if it's full and allowing it's capacity to be changed by a system operator

 Airports have the following attributes;
 - planes (array of planes on it's ground)
 - capacity (maximum number of planes it can have at one time on the ground)
 - a deafult capacity

Planes

Planes are responsible for;

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

 The classes have attributes which can be read by objects from other classes but can only be updated by itself.


 Airports

 Airports have the following attributes;
 - planes (array of planes on it's ground)
 - capacity (maximum number of planes it can have at one time on the ground)
 - a default capacity

 Airports are responsible for;
 - knowing what planes it currently has on the ground.  
 - telling planes whether they can land or take off based on weather and capacity
 - checking if it's current weather is stormy or not (and randomly assigning storms)
 - knowing it's capacity, knowing if it's full and allowing it's capacity to be changed by a system operator

Planes

Planes have the following attributes;
 - status (ariborne or grounded)
 - a current airport (nil if airborne)

Planes are responsible for;
 - not taking off if already grounded and not landing if not already airborne
 - asking airpots whether they can take off or land
 - not landing or taking off if told not to
 - telling airports once they are taking off or landing

 ***Note***

 It wasn't specified wether planes always enter the system (are created) in the air or on the ground in an airport. I therefore made it possible for planes to enter the system on ground or in air. If entering on ground they must tell the airport they are entering. 

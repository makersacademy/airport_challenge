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

My solution uses 2 unique objects, Airport and Plane. 

Airport is the main, it is initialised with a name. On instantiation it provides an Airport with a default 3 spaces for planes, and an empty hanger array to store planes.

The Airport class also features a random weather generator, to simulate a changing environment.
Using the taxi and depart methods will land or take off the specified plane from the specified airport. It is not possible to take off a plane from an airport that it is not landed at.

The Plane class controls everything related to a plane object. It is instansiated with a status, which is set to "GROUNDED", as planes are built on the ground :D. 
Taking off and landing will change the state of the plane. Trying to land a plane which is already on the floor is not possible, and attempts will be futile.

Some error handling has been implemented to prevent flying in adverse weather conditions. 
Some error handling has been implemented to prevent landing a plane that is already landed, also for taking off a plane that is already airbourne.

Things to fix.
When a plane is created, it must take off first, and then land at an airport. It would be nice for a plane to be created in an Airport.

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport


As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
(At this stage I will initialize the airport class with an @planes method which is an array for storing planes.  First I created a new Plane class and added a require relative to the airport file.  Planes can now be stored or removed from the airport in the @planes array).

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
(I have added a method that randomly chooses a number between 1 and 100.  If it is 90 or below, the weather is sunny and planes can take off.  Otherwise planes cannot take off due to stormy conditions.)
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
(Likewise I can )
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

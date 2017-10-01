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

Challenge
---------

It was immediately clear that this was extremely similar to the Boris Bike challenge. 
There was an extra class to be add though which took the count to three. Airport, Plane, Weather and it didn't take long to se a clear path for them interacting with each other. 

Airport like Docking Station and Plane like Bike. 
I started on the Airport class as I knew this was going to be the most complicated and would probably end up taking most of my time as it did. 
I struggled with the logic driving the errors and, realising even though my tests worked, my logic was not sound. I rethought and refactored my code and after a lot of research I managed to figure it out. 
I found most of the integration and testing of the class quite easy but enjoyed the challenge as it gave me more needed practice at TDD which I have finally grasped.

I implemented the following User Stories:

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

Coverage
---------

I managed to get 100% coverage with my tests

Bonus
---------

I completed the bonus after researching this on the Relish website. I did read a couple of tutorials about this and understood the logic well enough to implement my own Feature Tests.
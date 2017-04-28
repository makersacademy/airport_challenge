Unfortunately I could not complete the challenge this weekend. My good friend from the U.S is staying here for the weekend before he leaves for a year again and I had to balance my time between that and this challenge. The timing was unfortunate but I do not foresee a similar circumstance for the rest of the course.

As for my plans for the last 2 user stories, for the 5th I would measure the length of planes stored in planes array, and then use a method like full? (like we used in boris bikes) to stop any more planes being added.

For the final user story I would assign the default capacity then allow for instances where the capacity is changed in certain situations and for different requirements. I am less sure with this one, but I am sure I could come up with something given time.



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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

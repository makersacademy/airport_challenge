Airport Challenge
=================

<a name= "task">TASK</a>  |  <a name= "edge">EDGE CASES</a>  |  <a name= "approach">APPROACH </a>

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
[Task](#task)
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

[Edge Cases / Extra features](#edge)
-----

- Inconsistent states of the system ensuring that planes can only take off from airports they are in.
- Planes that are already flying cannot takes off and/or be in an airport.
- Planes that are landed cannot land again and must be in an airport.
- Write an RSpec **feature** test that lands and takes off a number of planes

[Approach](#approach)
-----

- TDD for each method (some removed in later refactoring).
- OOD - Planes and Weather are detached entities from the airport. However, the majority if methods on the Airport class, including those that land or take-off as it seemed that what's really happening is the airport controlling flights with results impacting the airport not the plane.
- Refactoring & code cleanliness checks in process.

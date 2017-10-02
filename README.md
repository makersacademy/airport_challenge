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

# Description
---------

First weekend challenge to use OO skills to build software for an airport.

# My Approach
---------

* I used user stories to create domain models and Class Responsibility Collaborators to sketch out relationships between the interaction of classes, objects and methods.
* Worked through first two user stories testing feature tests in IRB initially then using RSpec to build unit tests
* Started with ```Plane``` and ```Airport``` classes with ```land``` and ```takeoff``` methods
* Separated ```taken_off?``` method into a different unit test  ]
* Features still to be added for:
  - weather
  - full airport
  - default airport capacity
  - edge cases

# Task
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

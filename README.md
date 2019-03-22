*Airport Challenge *
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

*Task:*

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Our task is to test drive the creation of a set of classes/modules to satisfy all the above user stories using TDD.

*User Stories:*

1) As an air traffic controller
   So I can get passengers to a destination
   I want to instruct a plane to land at an airport and confirm that it has landed

2) As an air traffic controller
   So I can get passengers on the way to their destination
   I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3) As an air traffic controller
   To ensure safety
   I want to prevent takeoff when weather is stormy

4) As an air traffic controller
   To ensure safety
   I want to prevent landing when weather is stormy

5) As an air traffic controller
   To ensure safety
   I want to prevent landing when the airport is full

6) As the system designer
   So that the software can be used for many different airports
   I would like a default airport capacity that can be overridden as appropriate


*Technologies Used*

- Ruby
- Rspec

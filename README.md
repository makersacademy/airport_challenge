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

User Stories
---------
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
**Diagram**

Object | Message
-------|----------
airport | land(plane)
plane | landed?
airport | take_off
plane |left?
weather | stormy?
airport | full?

**Steps taken**

*User Story 1: Landing & confirming a plane has landed*
- [x] Feature and unit tested capacity to check if a plane has landed
- [x] Implemented `landed?` method to check if a plane has landed
- [x] Feature and unit tested capacity to land a plane at airpot
- [x] Implemented `land(plane)` method to land a plane at airport

*User Story 2: Taking-off & confirming a plane has taken-off*
- [x] Feature and unit tested capacity to check if a plane has taken-off
- [x] Implemented `left?` method within the Plane class to check if a plane has taken-off
- [x] Feature and unit tested capacity to take-off a plane from an airpot
- [x] Implemented `take_off` method within the Airport class to take-off a plane from an airpot

*User Story 3: Preventing take-off during storms*
- [x] Feature and unit tested capacity to check if weather is stormy
- [x] Implemented `stormy?` method within the Weather module to check if weather is stormy
- [x] Feature and unit tested capacity to prevent a plane from taking off during storms
- [x] Implemented a fail condition within the `take_off` method to prevent a plane from taking-off during storms

*User Story 4: Preventing landing during storms*
- [x] Feature and unit tested capacity to prevent a plane from landing during storms
- [x] Implemented a fail condition within the `land(plane)` method to prevent a plane from landing during storms

*User Story 5: Preventing landing when airport is full*
- [x] Feature and unit tested capacity to prevent a plane from landing if the airport is full
- [x] Initialised capacity within Airport class
- [x] Implemented `full?` method within the Airport class which asserts whether the airport is at capacity
- [x] Implemented a fail condition within the `land(plane)` method to prevent a plane from landing if the airport is full

*User Story 6: Overriding airport capacity*
- [x] Feature and unit tested capacity to set a custom airport capacity
- [x] Implemented a fail condition within the `land(plane)` method to prevent a plane from landing during storms

*Defending against edge cases*
- [ ] Planes only take off from airports they are in
- [ ] Planes already flying cannot take off or be in an airport
- [ ] Planes that are landed cannot land again and must be in airport

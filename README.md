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
User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
User Story 1 - Feature Test
```
airport = Airport.new
plane = Plane.new
airport.land(plane)
```
User Story 2
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
User Story 3
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
User Story 4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
User Story 5
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
User Story 6
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
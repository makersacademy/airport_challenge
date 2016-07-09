# **Airport challenge** #

This is a small Ruby program that simulates the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.


```
          _____
         _\____\___
 =  = ==(____MA____)
           \_____\___________________,-~~~~~~~`-.._
           /     o o o o o o o o o o o o o o o o  |\_
           `~-.__       __..----..__                  )
                 `---~~\___________/------------``

```

## User Stories ##

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
## Domain model ##

| Objects   |  Messages |
|    ---    |    ---    |
|   Plane   |  landed?  |
|           |  flying?  |
| Airport   | land      |
|           | take_off  |
| Weather   | condition |

---
###### Plane ← landed/flying → true || false

###### Airport ← land/take_off → Plane

---


## Learning objectives ##

* Object-Orientated-Design (OOD)
* Test-Driven-Development (TDD)
* RSpec workflow
* Single-Responsibility-Principle (SRP)
* Getters & setters
* Instance variables
* Doubles and mock behaviours
* Method stubs

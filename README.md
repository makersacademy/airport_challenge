# Airport Challenge
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
## Task
-----

I am creating a program to emulate a airport. This will include the landing and taking-off of planes subject to weather conditions. 


I will accomplish this by using TDD to create tests that are based on the user stories and then write code that will then pass these tests to ensure that the spec been met. I will also try to consider edge cases and prepare my code for them accordingly.

## Instructions


## User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
## Table representation of User Stories

|  Objects              |  Methods          |
| --------------------- | ----------------- | 
| Airport               | land(plane)       |
| Airport               | take_off(plane)   |
| Airport               | full?             |
| Airport               | capacity          |
| Weather               | stormy?           |

Here is a table that shows what methods each object will need in order to satisfy the user stories.

## References
```https://stackoverflow.com/questions/36580186/how-to-test-that-an-element-is-randomly-selected-from-a-list```
Used this answer in order to manipulate the RNG used for the weather when doing unit tests.

#User Stories

## Nouns
* plane
* airport
* weather

## Verbs
* land
* take off
* prevent

### USER STORY 1

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

| Objects       | Messages      |
| ------------- | ------------- |
| Plane         | land          |
| Airport       |               |

### USER STORY 2

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Objects       | Messages      |
| ------------- | ------------- |
| Plane         | takeoff       |
| Airport       | check_airport |

### USER STORY 3

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

| Objects       | Messages        |
| ------------- | --------------- |
| Plane         | prevent_takeoff |
| Airport       |                 |
| Weather       |                 |

### USER STORY 4
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

| Objects       | Messages        |
| ------------- | --------------- |
| Plane         | prevent_landing |
| Airport       |                 |
| Weather       |                 |

### USER STORY 5
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

| Objects       | Messages        |
| ------------- | --------------- |
| Plane         | prevent_landing |
| Airport       |                 |


### USER STORY 6
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
| Objects       | Messages        |
| ------------- | --------------- |
| Airport       | prevent_landing |

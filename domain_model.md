## User Stories to Domain Model

## Scenario

### 1.
As an air traffic controller,
So I can get passenger to a destination
I want to instruct a plane to land at an airport

### 2.
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# Nouns in Use Stories
- Controller
- Passenger
- Plane
- Airport

## Verbs in Use Stories
- land
- takeoff
- in_airport

## Function Representation

| object      | Messages          |
|-------------|-------------------|
| Controller  |                   |
| Passenger   |                   |
| Plane       | in_airport?       |
| Airport     | land <br> takeoff |


## How my Objects will be use messages to communicate with one another

Airport <-- land

Airport <-- takeoff --> plane

Plane <-- in_airport --> true/false

# Weekend Challenge 1 - Airport Challenge
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
## About
---------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.\
Here are the user stories worked out in collaboration with the client:

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

## User Story 1 - Land Plane
---------
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

OBJECTS | MESSAGES |
|-------------|-------------|
 Air Traffic Controller | |
 Plane | land_at_airport |

 ## User Story 2 - Instruct plane to take off


 ```
 As an air traffic controller
 So I can get passengers on the way to their destination
 I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 ```
 OBJECTS | MESSAGES |
 |-------------|-------------|
  Air Traffic Controller | |
  Plane | take_off |

  ## User Story 3 - Prevent take off in storms

  ```
  As an air traffic controller
  To ensure safety
  I want to prevent takeoff when weather is stormy
  ```
  ## User Story 4 - Prevent landing in storms

  ```
  As an air traffic controller
  To ensure safety
  I want to prevent landing when weather is stormy
  ```
  ## User Story 6 - Set default capacity for airport

  ```
  As the system designer
  So that the software can be used for many different airports
  I would like a default airport capacity that can be overridden as appropriate
  ```

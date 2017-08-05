# Domain Model

| Objects          | Messages     |
|------------------|-------------:|
| Air Traffic Controller           |              |
| Plane            |    |
| Weather  | stormy?
| Airport  | land |
| Airport  | takeoff |
| Airport  | airport_capacity |
| System Designer | airport_capacity



## User Story

```
1. As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

2. As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

3. As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

4. As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

5. As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

6. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

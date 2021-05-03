# Airport Challenge

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

``````

## Task

---

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

## User Stories

---

[User Story 1 : Land Plane] (#U1)
[User Story 2 : Takeoff Plane] (#U2)
[User Story 3 : Prevent takeoff when weather is stormy] (#U3)
[User Story 4 : Prevent landing when weather is stormy] (#U4)
[User Story 5 : Prevent landing when the airport is full] (#U5)
[User Story 6 : Overridden default airport capacity] (#U6)#

## User Stories & Object Model

#### User Story 1: Land Plane

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

| Object     | Messages   |
| ---------- | ---------- |
| controller |
| passenger  |
| plane      |
| airport    | land_plane |

#### User Story 2: Take-off Plane

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport
and confirm that it is no longer in the airport
```

| Object     | Messages     |
| ---------- | ------------ |
| controller |
| passenger  |
| plane      |
| airport    | land_plane   |
| airport    | launch_plane |

#### User Story 3: Prevent take-off in stormy weather

```
As an air traffic controller
To ensure safety
I want to prevent take-off when weather is stormy
```

| Object     | Messages     |
| ---------- | ------------ |
| controller |
| passenger  |
| plane      |
| airport    | land_plane   |
| airport    | launch_plane |
| airport    | stormy?      |

1. stormy? is a predicate method
2. Prevents launch_plane if stormy? is true (guard condition)
3. Allows launch_plane if stormy? is false
4. Provide an input for stormy? to be able to return true

#### User Story 4: Prevent landing in stormy weather

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

| Object     | Messages     |
| ---------- | ------------ |
| controller |
| passenger  |
| plane      |
| airport    | land_plane   |
| airport    | launch_plane |
| weather    | stormy?      |

#### User Story 5: Prevent landing when airport is full

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| Object     | Messages         |
| ---------- | ---------------- |
| controller |
| passenger  |
| plane      |
| airport    | land_plane       |
| airport    | launch_plane     |
| airport    | prevent_take_off |
| airport    | prevent_landing  |
| airport    | full?            |
| weather    | stormy?          |

#### User Story 6: Airport capacity

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| Object     | Messages         |
| ---------- | ---------------- |
| controller |
| passenger  |
| plane      |
| airport    | land_plane       |
| airport    | launch_plane     |
| airport    | prevent_take_off |
| airport    | prevent_landing  |
| airport    | full?            |
| airport    | set_capacity     |
| weather    | stormy?          |

## Edge Cases

#### User Story 7:

```
As an air traffic controller
To ensure consistency
I want to ensure that planes can only take off from airports they are in
```

#### User Story 8

```
As a system designer
So I can ensure system consistency
I do not want to allow flying planes to take off and/or be in an airport
```

#### User Story 9

```
As an air traffic controller
To ensure consistency
I want to ensure that not-flying planes can land and must be in the airport
```

## Domain Modelling

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
| object | message |
|--|--|
|airport| land(plane)|
|plane| lands |
|airport| adds plane to inventory|

DONE

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| object | message |
|--|--|
|airport| takeoff(plane)|
|plane| takes off |
|airport| removes plane from inventory|

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
| object | message |
|--|--|
|airport| check_weather(weather) |
| weather | stormy? |
|airport| takeoff(plane) unless stormy |

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
| object | message |
|--|--|
|airport| check_weather(weather) |
| weather | stormy? |
|airport| land(plane) unless stormy |

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| object | message |
|--|--|
|airport| land(plane) unless full? |

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
| object | message |
|--|--|
| airport | variable capacity|

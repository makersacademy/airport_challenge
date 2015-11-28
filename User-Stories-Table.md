```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | landing |
| Plane   | landed?  |

```
Airport <-- landing --> Plane
Plane <-- landed? --> true/false
```


```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | take_off |
| Plane   | landed?        |

```
Airport <-- take_off --> Plane
Plane <-- landed? --> true/false
```

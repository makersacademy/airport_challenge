```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | landing |
| Plane   | confirmation  |

```
Airport <-- landing --> Plane
Plane <-- confirmation --> "landed"
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
| Plane   | confirmation |

```
Airport <-- take_off --> Plane
Plane <-- landed? --> "in air"
```


```
As an air traffic controller
To ensure safety
I want to prevent take off when weather is stormy
```
| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | condition |
| Plane   | take_off |

```
Airport <-- condition --> true/false = (true=stormy/false=good)
Plane <-- take_off --> raise_error
```


```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | condition |
| Plane   | landing |

```
Airport <-- condition --> true/false = (true=stormy/false=good)
Plane <-- landing --> raise_error
```


```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | full? |
| Plane   | raise_error |

```
Airport <-- full? --> true/false
Plane <-- landing --> raise_error
```


```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
| Objects | Messages |
|---------|----------|
| Air traffic controller |   |
| Airport | Airport.new |
|         | full?
| Plane   | landing |
```
Airport <-- Airport.new --> int value
Plane <-- landing --> "landed"
Airport <-- full? --> raise_error
```

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

| Objects  | Messages |
| ------------- | ------------- |
| Passengers  | ? |
| Plane  | land  |
| Airport | ? |

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
| Objects  | Messages |
| ------------- | ------------- |
| Passengers  | ? |
| Plane  | take_off  |
| Airport | contains_plane |

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
| Objects  | Messages |
| ------------- | ------------- |
| Weather  | stormy? |
| Plane | take_off (not when stormy)

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
| Objects  | Messages |
| ------------- | ------------- |
| Weather  | stormy? |
| Plane  | land (not when stormy) |

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
| Objects  | Messages |
| ------------- | ------------- |
| Plane  | land (not when full) |
| Airport | full? |

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| Objects  | Messages |
| ------------- | ------------- |
| Airport | capacity |

```
Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
```

```
BONUS

Write an RSpec feature test that lands and takes off a number of planes
```

## Brain dump
 * Should there be be a state check in receive & release?
 * Should strings use constants & test call the constants?
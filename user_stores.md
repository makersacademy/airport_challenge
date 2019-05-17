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


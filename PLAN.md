# Aiport Challenge

User Stories:
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Object Domain Model

| Object | Message |
| ---   | --- |
| Plane | land |
| | take_off  |
| | flying? |
| Aiport | dock(plane) |
| | depart
| |docked?(plane)    |
| | full? |
| | DEFAULT_CAPACITY |
| WeatherReport | check_weather |

[ Airport ] --(dock(plane))--> [ Self ] --(Land)--> [ Plane ]

[ Airport ] --(depart)--> [ Self ] --(take_off)--> [ Plane ]
                                   --(delete(Plane))--> [ @planes ]

[ Airport ] --(docked?(plane))--> [ Self ] 

[ Airport ] --(full?(plane))--> [ Self ]

## Tests

#### Airport
- dock
  - [ ] Responds to dock with 1 argument
  - [ ] Adds a plane to @planes
  - [ ] Changes a plane's state to be !flying?

#### Plane

- land
  - [ ] Responds to land
  - [ ] Changes flying? to be false
- take_off
  - [ ] Responds to take_off
  - [ ] Changes flying? to be true
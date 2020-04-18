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
| Plane | land_at(airport) |
| | depart_from(airport)  |
| | flying? |
| Aiport | dock(plane) |
| | undock(plane) |
| |docked?(plane)    |
| | full? |
| | DEFAULT_CAPACITY |
| WeatherReport | check_weather |

[ Plane ] --(land_at(aiport)) --> [ Self ] --(dock(self))--> [ Airport ]
                                           --(to false)--> @flying?

## Tests

#### Airport
- dock(plane)
  - [ ] Responds to dock with 1 argument
  - [ ] Adds a plane to @planes
- undock(plane)
  - [ ] Responds to undock with 1 argument
  - [ ] Removes a plane from @planes
- docked?(plane)
  - [ ] Responds to docked? with 1 argument
  - [ ] Returns true if plane IS in dock
  - [ ] Returns false if plane IS NOT in dock

#### Plane
- land_at(airport)
  - [ ] Responds to land_at with 1 argument
  - [ ] Changes flying? to be false
  - [ ] Call dock method on airport
- depart_from(airport)
  - [ ] Responds to depart_from with 1 argument
  - [ ] Changes flying? to be true
  - [ ] Call undock method on aiport
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
| | depart  |
| | flying? |
| | port |
| Aiport | dock(plane) |
| | undock(plane) |
| |docked?(plane)    |
| | capacity |
| | full? |
| | DEFAULT_CAPACITY |
| WeatherReport | check_weather |

[ Plane ] --(land_at(aiport)) --> [ Self ] --(dock(self))--> [ Airport ]
                                           --(to false)--> @flying?

## Tests

#### Airport
- planes
  - [x] Responds to planes
  - [x] @planes is an instance of an Array
- dock(plane)
  - [x] Responds to dock with 1 argument
  - [x] Adds a plane to @planes
- undock(plane)
  - [x] Responds to undock with 1 argument
  - [x] Removes a plane from @planes
- docked?(plane)
  - [x] Responds to docked? with 1 argument
  - [x] Returns true if plane IS in dock
  - [x] Returns false if plane IS NOT in dock
- full?
  - [ ] Responds to full?
  - [ ] Returns a boolean
  - [ ] Returns true when airport is at maximum capacity
  - [ ] Returns false if airport is under capacity
- capacity
  - [x] Responds to capacity
  - [x] Returns and integer
  - [ ] Capacity can't be less than 1

#### Plane
- land_at(airport)
  - [x] Responds to land_at with 1 argument
  - [x] Changes @state to be false
  - [x] Changes @port to be an instance equal to aiport
  - [x] Call dock method on airport
  - [ ] Cannot land when it has already landed
- depart
  - [x] Responds to depart
  - [x] Changes flying? to be true
  - [x] Call undock method on airport
  - [x] Cannot depart from a different airport than the one it is in
  - [x] Cannot depart while already flying
- port
  - [x] Responds to port
- flying?
  - [x] It responds to flying
  - [x] It returns a bool
  - [x] It starts as not flying
Airport Challenge
=================

This program allows planes to land and take off from airports, weather permitting. 

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Intructions for use
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

How this program was built
-------

The following program was bulit using the below domain model and user stories. 

### Domain Model
|  Objects | Messages  |
|---|---|
| Plane  | land, take off (attributes: landed, flying) |
| Airport | land, take off (attributes: planes, capacity, weather) |
| Weather  | stormy?  |

### User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
Feature Test
```
airport = Airport.new
plane = Plane.new
airport.land(plane) # should return plane
```

### User Story 2
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Feature Test
```
airport = Airport.new
plane = Plane.new
airport.take_off # should return nil
airport.land(plane)
airport.take_off # should return "Plane has left the airport"
```

### User Story 3
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
Feature Test
```
irport = Airport.new
plane = Plane.new
airport.land(plane)
airport.land(plane) # should throw error "Airport full"
```

### User Story 4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Feature Test
```
airport = Airport.new
airport.capacity # returns default set at 100
airport.capacity = 50 # allow system designer to override default capacity
or 
airport = Airport.new(50)
```

### User Story 5
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
Feature Test
```
airport = Airport.new 
plane = Plane.new
airport.take_off(plane) # if weather condition is stormy, then should return error message 'Bad weather, cannot take off'
```

### User Story 6
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
Feature Test
```
airport = Airport.new 
plane = Plane.new
airport.land(plane) # if weather condition is stormy, then should return error message 'Bad weather, cannot land'
```

Testing for Edge Cases
-------
After implemeting the above user stories, I tested for the following edge cases:

1. Planes already flying cannot take off again
2. Planes landed cannot land again
3. Planes only take off from airports they are in
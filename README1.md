# Airport Challenge #

## User Story 1 ##

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new
plane = Plane.new
airport.land(plane)
```

## User Story 2 ##
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new
plane = Plane.new
airport.take_off(plane)
airport.check
```

## User Story 3 ##
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new
plane = Plane.new
airport.take_off(plane) # this should return false as the weather is stormy #
```

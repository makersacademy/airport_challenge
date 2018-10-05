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
airport.weather("stormy")
airport.take_off(plane)
```

This should return an error as the weather is stormy.

## User Story 4 ##
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new
plane = Plane.new
airport.weather("stormy")
airport.land(plane)
```

This should return an error as the weather is stormy.

## User Story 5 ##
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new(1)
airport.hanger << Plane.new
airport.land(Plane.new)
```

This should return an error as the airport is full.

## User Story 6 ##
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

#### Feature Test ####
```
require './lib/airport_challenge'
airport = Airport.new
airport.capacity
```

This should return an airport with a capacity of 20.

## Edge Cases ##

* Planes can only take off from airports that they are currently in.

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

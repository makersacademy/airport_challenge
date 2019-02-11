# This is my week 1 weekend project 'Airport_Challenge'

## User Stories Completed
### Story 1
#### User Story
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
#### Feature Test in IRB
```
require './lib/airport.rb'
plane = Plane.new
airport = Airport.new('Heathrow')
airport.land_plane(plane)
```

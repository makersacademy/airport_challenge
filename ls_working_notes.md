# Airport Challenge

## User story 1 - plane to land at airport

* Nouns - plane, airport, (passenger)
* Verbs - land

Need class for airport & plane. Need method of land.

### Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new
plane = airport.land_plane(Plane.new)
```

## User story 2 - plane to take off from airport **&** confirm no longer at airport

* Nouns - plane, airport - no new classes needed
* Verbs - take-off

Need method of take-off, and way of monitoring whether plane has left airport.

### Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new
plane = airport.take_off
```
Expect output: "The plane has left"

## User story 3 - prevent landing when airport is full
------------
* Nouns - plane, airport - no new classes needed
* Verbs - land - land method already exists

Need to add condition to land method so that plane cannot land if airport is full.
Don't know capacity of airport - assume that it can take one plane.

### Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new
airport.land_plane(Plane.new)
airport.land_plane(Plane.new)
```
Expect error as there is already a plane at the airport

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
Don't know capacity of airport - assume that it can take five planes.

### Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new
5.times { airport.land_plane(Plane.new) }
airport.land_plane(Plane.new)
```
Expect error as there are already 5 planes at the airport

## User story 4 - would like default airport capacity that can be overwritten
------------
* Nouns - plane, airport - no new classes needed
* Verbs - n/a

Need to set default capacity on creation of airport class, but allow this to be overwritten.
Choose to set default capacity as 5 planes.

### Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new(2) # resets default capacity to 2 planes
2.times { airport.land_plane(Plane.new) }
airport.land_plane(Plane.new)
```
Expect error as the airport is full

## User story 5 - prevent take-off when weather is stormy
Plan to create a random number generator e.g. 1-5 where 5 is stormy and other numbers are sunny.
Class of airport initializes with random weather.

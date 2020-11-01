Airport Challenge
=================

User story 1 - plane to land at airport
------------
* Nouns - plane, airport, (passenger)
* Verbs - land

Need class for airport & plane. Need method of land.

Feature test:
```ruby
require "./lib/airport.rb"
airport = Airport.new
plane = airport.land_plane
```

User story 2 - plane to take off from airport & confirm no longer at airport
------------
* Nouns - plane, airport - no new classes needed
* Verbs - take-off

Need method of take-off, and way of monitoring whether plane has left airport.

User story 3 - prevent landing when airport is full
------------
* Nouns - plane, airport - no new classes needed
* Verbs - land - land method already exists

Need to add condition to land method so that plane cannot land if airport is full.

# Airport Challenge

## Domain model

What I created from reading the user stories and extracting nouns and verbs:

|Object    |Message
|----------|-------
|Passenger | destination
|Plane     | location, land, take_off
|Weather   | stormy?
|Airport   | location, full?, capacity

TDD Process documented [here](https://github.com/dafuloth/airport_challenge/blob/master/1_airport_challenge_tdd.md).

### In hindsight

* In the end, there was no need to consider the Passenger
* If/when I refactor: I think `Weather` should be linked with `Airport`, instantiated and assigned to an instance variable (i.e. Airport.weather) - weather is a geographic thing and so it makes sense conceptually that each location/airport would have its own weather
* If/when I refactor: `attr_accessor :landed_planes` probably makes the `full?` method unnecessary, since `full?` can be determined by directly accessing the array: comparing `landed_planes.count` to `capacity`
* If I knew the rspec syntax, I would have used doubling in the tests

### The implementation

Three classes: Plane, Weather, Airport

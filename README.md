# Airport

Week 1 Weekend Challenge at Makers. This was conducted in my own time to reinforce the weeks learning obectives. The objectives of the week were to learn to test drive an object orientated program in Ruby. This was not only my first week at Makers, but the first time using Ruby for a fully functional program, and my first time using RSpec, the testing library.

Although simple in design this app taught me a great deal about OOD. I have lef tthis as it was in my first week to show how far I have come in my programming journey.

The functionality of the app:

A user can create an Airport object which can then be used to land planes - aimed at simulating an Airport. A User can:

- Instantiate a new Airport
- Land a Plane
- Take off a Plane
- When landing a plane, an error will appear if the Airport has reached max capacity
- When landing a plane, an error will appear if the weather is Stormy (1/9 chance)
- See the hanger of the airport - how many planes have landed
- See the current capacity

---

## How to Run

Clone this repo, and from the command line navigate to the [_Airport Challenge_](airport_challenge). In the command line type:

```
irb
```

This will start the Ruby REPL. Then type the following:

```
require './lib/airport'
```

This will require the files you need to instantiate new Docking Stations and Bikes. This can be done by the following commands:

```
airport = Airport.new
```

This will return a Hexadecimal number, indicating the creation of the new object. You can then type in the following in the command line to action the object accordingly:

```
airport.capacity
airport.planes
airport.land("Plane_1")
airport.take_off("Plane_1")

```

---

To run the test suite (RSpec), in the command line type:

```
rspec
```

This will display 7 passing tests with 96% coverage.

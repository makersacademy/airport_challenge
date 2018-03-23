# Gabriel's Airplane Emporium
:airplane: :airplane: :airplane: :airplane: :airplane: :airplane: :airplane: :airplane:
### aka Week 1 weekend challenge.

### Features:

## Airport:
Can do all kinds of cool stuff like landing and takeoffing (?) planes. Except when the weather is :poop:. Then it can't do those things because people might die. We don't want that at our airports.

### Current Features:
#### \#initialize
`.initialize` => Runs when `Airport.new` is called. Creates a new airport. Takes
one argument which sets the capacity of the airports hangar. If no arguments are
given `DEFAULT_CAPACITY` is used to set `@capacity`. `DEFAULT_CAPACITY` is set to 100.

Notes:
* Airport.new creates an airport with a `@hangar` with a capacity of `DEFAULT_CAPACITY`.
* If an argument is provided then the `@capacity` of `@hangar` will be set to that number.
* Entering anything other than a positive integer for capacity will raise an error.

Examples:

```
our_airport = Airport.new
our_airport.capacity # => 100, also known as DEFAULT_CAPACITY

other_airport = Airport.new(50)
other_airport.capacity # => 50
```

#### \#land
`land(plane)` => takes a plane instance as an argument and tells it
to land at the airport.

Notes:
* Landed planes appear in the airport's `@hangar`.
* Only instances of the `Plane` class can be landed. Attempting to land anything
else raises the error (`not_a_plane_error`).
* Attempting to land a plane at a full airport will raise `airport_full_error`.

Examples:

```
our_airport = Airport.new
our_plane = Plane.new
our_airport.land(our_plane)
our_airport.hangar # => [our_plane]

our_airport.land("this is a string not a plane")
# => RuntimeError: That's not a plane! It can't land here!
```

#### Future Features:

Taking off

Not letting planes take off in :poop: weather.

## Plane

Doesn't even have wings yet.

## Weather

What's a weather?

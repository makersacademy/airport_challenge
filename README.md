# Airport Challenge

## Approach
* I aimed for a 'proper' TDD approach, only writing code in the ./lib files
after first writing a test in the ./spec folder.

* As seen in earlier commits, my initial approach was to call #land and #take_off
methods on planes, as such:

```ruby
plane.land_at(airport)
plane.take_off_from(airport)
```

* This proved to be problematic. I couldn't figure out a way to do this
without an attribute accessor on the planes array (stored within each airport).
It would probably be best if the user could not access this array.

* My second approach was to call #land and #take_off on the airports themselves,
passing planes as arguments:

```ruby
airport.land(plane)
airport.take_off(plane)
```

* This led to refactoring much of the code, but it seems to work better now.

## How to use

* From the root directory load ./lib/airports.rb into irb.

* Create new planes with Plane.new, and new airports with Airport.new(capacity).
The default capacity for airports is 10 (if no argument given to #new).

* Users should not call methods on plane objects.

* Users can land planes in an airport using the #land method. Planes can
take off using the #take_off method.

* Planes cannot land if they are already landed, or take off if they are in
the air.

* Planes cannot land at an airport which has no capacity left.

* There is a 1/5 chance the weather will be stormy, in which case planes cannot
land or take off.

```
$ irb -r ./lib/airports.rb
2.5.0 :001 > airport = Airport.new(20)
2.5.0 :002 > plane = Plane.new
2.5.0 :003 > airport.land(plane)
2.5.0 :004 > airport.take_off(plane)
```

## Thoughts

* The default status of new planes is :flying. They could start within airports,
if given the airport as an argument. Not sure if this is better.

* I could try using the before hook in the rspec tests, will have to think if
it would increase concision.

* The plane methods #change_status and #landed? are available publicly. Curious
if I can make them available to ./lib/airports.rb without this being the case.

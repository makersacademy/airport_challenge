# Airport Challenge

## Approach
* I aimed for a TDD approach, only writing code in the ./lib files
after first writing a test in the ./spec folder.

* There were a series of user stories which needed to be fulfilled, as below:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is
no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

* The process for each user story was fairly similar. From the user stories I
feature tested in irb which informed the writing of unit tests. Passing these
tests drove the code in airports.rb, planes.rb, and weather.rb.

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

* This led to refactoring much of the code, but it seems to work better now
with no public access to the planes array.

## How to use

* From the root directory load ./lib/airports.rb, ./lib/planes.rb and
./lib/weather.rb into irb.

* Create new planes with Plane.new, and new airports with Airport.new(capacity).
The default capacity for airports is 10 (if no argument given).

* Users do not have to call any methods on plane objects.

* Users can land planes in an airport using the #land method. Planes can
take off from an airport using the #take_off method.

* Planes cannot land if they are already in any airport, or take off if they are
in the air.

* Planes cannot land at an airport which has no capacity left.

* There is a 1/5 chance the weather will be stormy, in which case planes cannot
land or take off.

### irb example

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

* I could try using 'before' or doubles more in the rspec tests, will
have to think if it can make the tests more concise.

* The plane methods #change_status and #landed? are available publicly. Curious
if I can make them available to ./lib/airports.rb without this being the case.

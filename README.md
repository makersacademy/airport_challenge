The Airport Challenge in Python
==============================

This is a solution to Makers Academy's [Airport Challenge](https://github.com/makersacademy/airport_challenge). There is also a version in
[JavaScript](https://github.com/Andrew47/airport_JS) and in [Python](https://github.com/Andrew47/airport-Python)

This solution uses a test-driven approach, with unit tests
implemented using [RSpec](http://rspec.info).

##Installation

Clone the repository and change into the directory:

```
$ git clone git@github.com:Andrew47/airport_challenge.git
$ cd airport_challenge
```
Use bundle to load the dependencies:

```
$ gem install bundle
$ bundle
```

##Using the program

Open irb and load the files:

```
$ irb
require './lib/airport'
require './lib/plane'
```

Then an airport can be created by typing `airport = Airport.new` and a plane by typing
`plane = Plane.new` in the command line.

The plane can land at the airport (`plane.land(airport)`) and can take off (`plane.take_off`). Weather is randomly generated each time an airport is created. Stormy weather prevents take off or landing.

If `plane.airborne?` returns `True`, the plane is in the air. If `plane.airborne?`
returns `False`, the plane has landed.

The default airport capacity is 20. However, a new airport (airport1000) can be created
with this default overridden (`airport1000 = Airport(1000)`). Planes cannot be landed at
a full airport (`airport.full?` returns True).

##User Stories being met
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

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

##Author
* [Andrew Burnie](https://github.com/Andrew47)

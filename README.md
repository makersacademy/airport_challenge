Airport Challenge
=================

**Makers Academy Week 1 Task**

This is a program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. This also confirms whether the planes are in or out of the airport.

The user stories and full instructions can be seen in [INSTRUCTIONS.md](INSTRUCTIONS.md).

* Programming language: Ruby
* Test framework: Rspec
* Developed using TDD

## Design of program:

Domain Model:

### Functional Representation

Objects  | Messages
------------- | -------------
Air Traffic Controller  |
Plane  | flying?, start_flying, end_flying
Weather | stormy?
Airport | land_plane(plane), take_off(plane), capacity

## Interface
The Air Traffic Controller (ATC) is expected to use `irb`. Instructions for use:

Getting started:
```ruby
require './lib/airport.rb'
require './lib/plane.rb'
```

Creating a new plane:
```ruby
plane = Plane.new
```


The ATC can confirm that a plane is in-flight:
```ruby
plane.flying?
=> true
```


...or else confirm that it has landed:
```ruby
plane.flying?
=> false
```


An airport can have a specific maximum capacity if required, otherwise it's just instantiated with a default capacity.
```ruby
airport_default = Airport.new
airport_large = Airport.new(100)
```

Each airport calls on the Weather module. There is a 1-in-4 chance of the weather being stormy:
```ruby
weather.stormy?
=> false or true
```

The ATC can instruct a plane to land. Checks are made to see if the plane is cleared for landing, including checking if the weather is good, and whether there is capacity to store the plane. There are also data checks to see if the plane is already in the airport and whether it is already flying. After landing the airport confirms the plane has landed.
```ruby
airport.land_plane(plane)
```


The ATC can instruct a plane to fly. Checks are made to see if the plane is cleared for landing, including checking if the weather is good, and whether there is capacity to store the plane. There are also data checks to see if the plane is in the airport and whether it has already landed. After take off the airport confirms the plane is flying.
```ruby
airport.take_off(plane)
```

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
class: Plane  | flying?, start_flying, end_flying
module: Weather | stormy?
class: Airport | land_plane(plane), take_off(plane), capacity

## Interface
The Air Traffic Controller (ATC) is expected to use `irb`. Instructions for use:

Getting started:
```ruby
require './lib/airport.rb'
require './lib/plane.rb'
```

#### The Plane class
A plane can use start_flying to fly and end_flying to land, and its status can be checked using flying?
```ruby
plane = Plane.new
plane.start_flying
plane.flying?
=> true
plane.end_flying
plane.flying?
=> false
```

#### The Weather module
Each airport calls on the Weather module using the method 'stormy?'. There is a 1-in-4 chance of the weather being stormy.

#### The airport class
The ATC can create an airport with a specific capacity, and override this as necessary. If no capacity is specified a default capacity is given.
```ruby
airport = Airport.new
airtport.capacity = 25
airport_large = Airport.new(100)
```

The ATC can instruct a plane to land and take off. Clearing checks are made before this happens. The weather is checked, and flights are prevented if it is stormy. Other checks are made, including whether there is capacity at the airport to land a plane. Data checks are made to see whether the plane is already at the airport, and whether the plane is already flying. After landing the airport confirms the plane has landed, and after take off the airport confirms it has left the airport.
```ruby
airport.land_plane(plane)
airport.take_off(plane)
```

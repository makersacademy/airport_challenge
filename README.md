Airport Challenge
=================

**Makers Academy Week 1 Task**

This is a program to allow an Air Traffic Controller to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. This also confirms whether the planes are in or out of the airport.

The user stories and full instructions can be seen in [INSTRUCTIONS.md](INSTRUCTIONS.md).

* Programming language: Ruby
* Test framework: Rspec
* Developed using TDD

## Design of program:

### Functional Representation

Objects  | Messages
------------- | -------------
Air Traffic Controller  |
class: Airport | land(plane), take_off(plane), capacity
module: Weather | stormy?
class: Plane  | flying?

## Interface
The Air Traffic Controller (ATC) is expected to use `irb`. Instructions for use:

Getting started:
```ruby
require_relative 'lib/airport.rb'
require_relative 'lib/plane.rb'
```

#### The Airport class
The ATC can create an airport with a specific capacity, and override this as necessary. If no capacity is specified a default capacity is given.
```ruby
airport = Airport.new
airtport.capacity = 25
airport_large = Airport.new(100)
```

The ATC can instruct a plane to land and take off. Clearing checks are made before this happens. The weather is checked, and flights are prevented if it is stormy. Other checks are made, including whether there is capacity at the airport to land a plane and whether the plane is in the airport before land and take_off.
```ruby
airport.land(plane)
airport.take_off(plane)
```

#### The Weather module
Each airport calls on the Weather module using the method 'stormy?'. There is a 1-in-4 chance of the weather being stormy.

#### The Plane class
A plane's status can be checked using flying?. This equals true if has left the airport and false if it has landed.
```ruby
plane = Plane.new
airport.land(plane)
plane.flying?
=> false
airport.take_off(plane)
plane.flying?
=> false
```

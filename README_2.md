# Airport challenge  

This software controls the flow of planes at an airport. The planes can land
and take off provided that the weather is sunny. Occasionally it may be stormy,
in which case no planes can land or take off.

It ensures that planes can only take off from airports they are in; planes
that are already flying cannot take off and/or be in an airport;
planes that are landed cannot land again and must be in an airport.

## My approach to solving the challenge:  
1. I created domain models for the user stories provided
2. I then began with a feature test to see how objects should interact
3. I followed TDD practices; writing simple tests and making them pass
one at a time
4. I continued to run feature tests to check how classes interact
5. Also running rubocop frequently to refactor code
5. I tackled edge cases once all user stories were satisfied, repeating the
above steps

## Challenges faced:  
1. Towards the start, I forgot to make frequent commits at red-green-refactor
intervals
2. Towards the end, I had difficulty refactoring the tests, getting to grips
with doubles, stubs and other methods in RSpec, but managed to complete it  

## Features  

```
$ irb
2.6.0 :001 > airport = Airport.new(150)
 => #<Airport:0x00007f8ef512bbd8 @capacity=150, @planes_held=[],
 @weather=#<Weather:0x00007f8ef512b930>>

2.6.0 :002 > plane = Plane.new
 => #<Plane:0x00007f8ef40fd748 @grounded=false>

2.6.0 :003 > airport.land(plane)
 => [#<Plane:0x00007f8ef40fd748 @grounded=true>]

2.6.0 :004 > plane2 = Plane.new
 => #<Plane:0x00007f8ef4117d78 @grounded=false>

2.6.0 :005 > airport.land(plane2)
 => [#<Plane:0x00007f8ef40fd748 @grounded=true>, #<Plane:0x00007f8ef4117d78
 @grounded=true>]

2.6.0 :006 > airport.takeoff(plane)
=> #<Plane:0x00007f8ef40fd748 @grounded=false>

2.6.0 :007 > airport.land(plane2)
RuntimeError (Plane has already landed)

2.6.0 :008 > airport.takeoff(plane)
RuntimeError (Plane is not at airport)

2.6.0 :009 > airport.land(Plane.new)
RuntimeError (Adverse weather conditions)

2.6.0 :010 > 150.times { airport.land(Plane.new) }
RuntimeError (Airport capacity has been reached)
```  

## Code style

- OOD
- TDD

## Tech used

- RSpec
- Ruby

## Getting started

**BUNDLE INSTALL??**

This programme is used in the terminal.

Require files "plane.rb", "airport.rb" and "weather.rb" in irb in the terminal.

## Running the tests

You can run tests by running "rspec" in the terminal in the airport_challenge directory.

#### Test coverage
- Checks planes can be landed
- Checks planes can takeoff
- Checks status of planes (whether grounded or airborne)
- Checks if the weather is stormy
- Checks airport can allow planes to land
- Checks airport can allow planes to take off
- Checks airport does not exceed capacity (airport can be given a custom
  capacity on creation, otherwise it will default to a capacity of 100 planes)
- Raises error if trying to land a plane that is already held at the airport
- Raises error if trying to land a plane in stormy weather
- Raises error if a plane tries to take off in stormy weather
- Raises error if a planes tries to take off from an airport where it is not
held

## Versioning

"airport_challenge" uses ruby version 2.6.0. To change ruby versions run
"rvm install ruby-2.6.0" in terminal.

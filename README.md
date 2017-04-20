Airport Challenge
=================

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

=================

## My approach

1. The first step was to write down the user stories and identify nouns and verbs to determine classes and methods that would need to be implemented to satisfy all the requirements.

2. Create `lib` and `spec` folders.

3. Create a different file for each class: `Airport`, `Plane`, `Weather`.

4. Start writing tests to implement functionality for each class.

5. Organise the tests according to the class they belong to (`Airport`, `Plane`, `Weather`), the method that are testing (`land`, `take_off`, `stormy?`) and the context (when weather is stormy, when weather is sunny) in order to make them more understandable and readable.

6. For each test, write a method in order to make the test pass.

7. Refactor.

=================

## Usage

Here's the full story of how the app is used from a user's perspective (`irb` transcript):

```
$ irb
irb(main):001:0> require_relative 'lib/airport'
=> true
irb(main):002:0> require_relative 'lib/plane'
=> true
irb(main):004:0> airport = Airport.new
=> #<Airport:0x007faeaa940920 @planes=[], @capacity=1, @weather=#<Weather:0x007faeaa9408f8>>
irb(main):005:0> plane = Plane.new
=> #<Plane:0x007faeaa931a60>
irb(main):006:0> airport.land(plane)
Landed
=> [#<Plane:0x007faeaa931a60>]
irb(main):007:0> airport.take_off(plane)
Departed
=> #<Plane:0x007faeaa931a60>

irb(main):014:0> airport.take_off(plane)
RuntimeError: This plane has not landed yet

irb(main):015:0> airport.land(plane)
Landed
=> [#<Plane:0x007faeaa931a60>]
irb(main):016:0> airport.land(plane)
RuntimeError: This plane has already landed

irb(main):037:0> airport.take_off(plane)
Departed
=> #<Plane:0x007faeaa931a60>
irb(main):038:0> airport.land(plane)
Landed
=> [#<Plane:0x007faeaa931a60>]
irb(main):039:0> airport.take_off(plane)
RuntimeError: Take off not permitted due to stormy weather

irb(main):045:0> airport.land(plane)
Landed
=> [#<Plane:0x007faeaa931a60>]
irb(main):046:0> airport.take_off(plane)
Departed
=> #<Plane:0x007faeaa931a60>
irb(main):047:0> airport.land(plane)
RuntimeError: Landing not permitted due to stormy weather
```

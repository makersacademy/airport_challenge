Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

**Feature tests**

```
2.7.0 :001 > require './lib/airport.rb'
 => true 
2.7.0 :002 > airport = Airport.new
2.7.0 :003 > plane = Plane.new
2.7.0 :004 > airport.land(plane)
 => [#<Plane:0x00007fe37187e0e0>] 
2.7.0 :005 > airport.take_off
 => #<Plane:0x00007fe37187e0e0> 
2.7.0 :006 > airport.full?
 => false 
2.7.0 :007 > 
```

**Rspec and rubocop results**

```
Airport
  can take off a plane
  does not allow landing when full
  plane can not land if weather is stormy
  overrides default capacity
  plane can not takeoff if weather is stormy
  #land
    allows planes to land
    has the plane after it has landed

Finished in 0.02784 seconds (files took 0.20415 seconds to load)
7 examples, 0 failures


COVERAGE: 100.00% -- 53/53 lines in 4 files

```
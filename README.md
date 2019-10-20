Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Introduction
-----

This repo was built using test-driven development to meet the specification set
out below.

It allows the user to create airports and planes, and to instruct planes to
take off and land at each airport.
- Airports have a default capacity of 10, which can be overridden by passing
  capacity in as an argument when an airport is initialized
- Planes cannot take off or land during stormy weather, which has a probability
  of 0.3
- The code aims to defend against the following edge cases:
  - Planes taking off when already in the air
  - Planes taking off from the wrong airport
  - Planes landing when they are not in the air
- All planes are in the air when first initialized.

Rspec tests are included in the 'spec' directory.
- At last commit, all tests were passing (12/12)
- At last commit, coverage was 100%

How to use the program
----

The following irb transcript should give an idea of how the program is
used.

```
$ irb
2.6.0 :001 > require './lib/airport'
 => true 
2.6.0 :002 > require './lib/plane'
 => true 
2.6.0 :003 > airbus = Plane.new
 => #<Plane:0x00007f9c2790d7e0 @location=:air> 
2.6.0 :004 > luton = Airport.new
 => #<Airport:0x00007f9c2791f5f8 @planes=0, @capacity=10> 
2.6.0 :005 > city = Airport.new(4)
 => #<Airport:0x00007f9c27925c28 @planes=0, @capacity=4> 
2.6.0 :006 > airbus.land(city)
=> RuntimeError (Too stormy for landing)
2.6.0 :007 > airbus.land(luton)
 => #<Airport:0x00007f9c2791f5f8 @planes=1, @capacity=10> 
2.6.0 :008 > airbus.take_off(luton)
 => :air 
2.6.0 :009 > airbus.land(city)
 => #<Airport:0x00007f9c27925c28 @planes=1, @capacity=4> 
 ```

Further comments
----

I used various online resources when building this repo, i.e. google, stack
overflow, relish, docs - the usual

With more time I would like to consider:
- Refactoring the entire codebase so that the user (air controller) interacts
  with airports, rather than planes. To me this feels more "real-world",
  although the specification implies that the plane objects should be the ones
  receiving messages like "land" and "take off".
- Making sure encapsulation is fully considered. There are areas this could
  definitely be improved, e.g. making the "stormy?" method private within
  'Airport'. I didn't have time to think about adjusting the tests to take this
  change into account.
- Tackling the bonus task of writing an RSpec feature test that lands and takes
  off a number of planes. I have been manually feature-testing using irb (as
  above).

Specification
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


#Airport Challenge

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

##Steps

1. Clone this repo
2. Run the command `gem install bundle`)
3. Run IRB
4. require './lib/airport'
5. Create a new instance of airport with airport = Airport.new
6. Create a new instance of plane with plane = Plane.new

##Using

Where plane is an instance of Plane and airport is an instance of Airport, the following commands can be used:

1. airport.land(plane) (instruct plane to land)
2. airport.take_off(plane) (instruct plane to take off)
3. airport.capacity (see max airport capacity)
4. airport.planes (see planes docked at airport)
5. airport.stormy? (see the weather forecast - true is stormy)

```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007f98f80c3440>
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007f98f80ba318 @capacity=10, @planes=[]>
2.5.0 :004 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/danieljones/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):4
        1: from /Users/danieljones/Documents/Projects/airport_challenge/lib/airport.rb:13:in `land'
RuntimeError (Stormy weather)
2.5.0 :005 > airport.land(plane)
 => [#<Plane:0x00007fd75691b6a0>]
2.5.0 :006 > airport.take_off(plane)
 => #<Plane:0x00007f98f80c3440>
2.5.0 :007 > airport.take_off(plane)
Traceback (most recent call last):
       3: from /Users/danieljones/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
       2: from (irb):15
       1: from /Users/danieljones/Documents/Projects/airport_challenge/lib/airport.rb:22:in `take_off'
RuntimeError (Stormy weather)
2.5.0 :008 > airport.capacity
 => 10
2.5.0 :009 > airport.planes
 => [#<Plane:0x00007f98f80c3440>, #<Plane:0x00007f98f80c3440>, #<Plane:0x00007f98f80c3440>]
```

##Approach

I approached the challenge by creating two classes:

Plane
Airport

The user is able to create an instance of a plane and land/take-off the planes at/from the airport.

A plane is unable to land or take-off if the weather is stormy. The weather is randomly generated from a method within the Airport class.

The maximum capacity for the airport is 10 planes, if there are too many planes at the airport no plane will be allowed to land.

I would have liked to add to the code to defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport.

The project was written using TDD and tested using RSpec. The project reports 98.04% test coverage.

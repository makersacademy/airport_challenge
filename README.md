!(Travis CI badge)[https://travis-ci.org/hanrattyjen/airport_challenge.svg?branch=master]

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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:


(Attempted) solution
---------------------

Used the forked README.md file to read User Stories.

From there, ran feature tests through irb and used Rspec to create unit tests.  Feature tests look as follows:

```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fe1940b6580 @planes=[], @capacity=20>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007fe19409db20 @landed=false>
2.2.3 :004 > airport.land_plane(plane1)
 => #<Plane:0x007fe19409db20 @landed=true>
2.2.3 :005 > airport.depart_plane(plane1)
 => []
2.2.3 :006 > airport.list
 => []
```

Used random number generator to have a 1/00 chance of the airport being stormy, and therefore no planes will be able to land or depoart.

I attempted to to use a mocks and stubs to override random weather and ensure consistent test behaviour. I was not able to use these throughout the entire unit testing. Need to figure out a way of mocking the same plane that can land and take off, instead of a new mock instance of plane being called after the initial instance.

My code defends against some edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

An RSpec **feature** test that lands and takes off a number of planes is found in spec file.



```
User Stories
---------------
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

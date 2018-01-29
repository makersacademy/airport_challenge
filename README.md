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

How to run
---------

1. `git clone`
2. `gem install bundle` (if you don't have bundle already)
3. `bundle`
4. `irb`

How to use
-----

1. `require './lib/airport.rb'`
2. `require './lib/plane.rb'`
3. `airport = Airport.new(20)` - Creates a new airport with a default capacity of 50. You can set your own capacity with an optional argument.
4. `plane = Plane.new` - Creates a new plane.
5. `airport.land(plane)` - Lands a plane at an airport.
6. `airport.take_off(plane)` - Takes off a plane from an airport.

My approach
-----

I began by looking at the user stories (see below) and using these to draw a domain model to see what objects and messages I would need. I would then feature test to decide what unit tests I would need to write.

Using TDD I would write a failing unit test, run `rspec` to see it fail, fix the error to make it pass and test again. If it passed I could then refactor. When all required unit tests were complete I would repeat the feature test to ensure everything was working as intended.

I created classes for Airport and Plane. Currently the weather is controlled by the Airport class, although in future weather could be extracted into its own class.

User Stories
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

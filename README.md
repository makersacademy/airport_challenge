# Airport Challenge

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)
``````

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

## My Approach

I focussed on one user story at a time, separating the story into objects and messages, eg. Object: Airport, message: land(plane). These would influence my Classes and methods. I ran a quick feature test in pry to understand what my unit test would need to be.

using the TDD approach, I created a test using RSpec, watched it fail, did the bare minimum to make it pass, and then refactored.

I fleshed out the airport as much as I could, and then tested for edge cases, and found that I could land and take off planes even when they were not in the airport. Before this point, I had not added any methods to my Plane object, and so spent a lot of time refactoring and fleshing out that class.

I decided not to test my Weather class directly, as all it does is use .sample to get either true or false from an array, and so testing whether .sample works is a bit redundant. Instead, I tested the airport class and how it uses the Weather class to raise errors if needs be.

## How it works

Here is an example of how the Airport functions:

```
pry(main)> airport = Airport.new

=> #<Airport:0x00007f9653135650 @capacity=15, @hangar=[], @weather=#<Weather:0x00007f9653135600>>

[4] pry(main)> plane = Plane.new

=> #<Plane:0x00007f9653166750>

[5] pry(main)> airport.land(plane)

=> #<Airport:0x00007f9653135650
 @capacity=15,
 @hangar=[#<Plane:0x00007f9653166750 @landed=true>],
 @weather=#<Weather:0x00007f9653135600>>

[6] pry(main)> airport.take_off(plane)

=> "#<Plane:0x00007f9653166750> has taken off"
[7] pry(main)>
```

There is also a chance that stormy weather will interfere with proceedings:

```
17] pry(main)> airport.land(plane)
RuntimeError: Landing unavailable. The storm is too heavy.

[18] pry(main)> airport.land(plane)

=> #<Airport:0x00007f9653135650
 @capacity=15,
 @hangar=[#<Plane:0x00007f9653166750 @landed=true>],
 @weather=#<Weather:0x00007f9653135600>>

[19] pry(main)> airport.take_off(plane)
RuntimeError: The weather is too bad!
```

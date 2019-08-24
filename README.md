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

Instructions
---------

This is a small application that allows the user to create, land and take off planes from airports. In order to run this application, the user will need to require the three necessary files: './lib/airport.rb'; './lib/weather_station'; './lib/plane.rb'.

You can set up an airport as follows:

```
$ irb
irb(main):008:0> weather_station = WeatherStation.new
=> #<WeatherStation:0x00007fc559179e38>
irb(main):009:0> airport = Airport.new(10, weather_station)
=> #<Airport:0x00007fc559091a20 @capacity=10, @planes=#<Set: {}>, @weather_station=#<WeatherStation:0x00007fc559179e38>>
irb(main):010:0> plane = Plane.new('BA165')
=> #<Plane:0x00007fc5591a0b50 @call_sign="BA165">
```

Use as follows:
```
irb(main):015:0> airport.land(plane)
=> #<Set: {#<Plane:0x00007fc5591a0b50 @call_sign="BA165">}>
irb(main):016:0> airport.landed?(plane)
=> true

```
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

Approach
-------

This was developed using TDD, largely in a mockist style, beginning with the Plane class, mocking out its implied dependencies and only then moving on to those dependencies. In the end though, the only class that actually needed mocking is the WeatherStation class, and were I not to have started with the assumption that Plane would actually have functionality, mockism vs. statism would have had little meaning in this project.

Design
-------

There are three classes in the system: Airport, WeatherStation, and Plane. 

Of the three, Plane is not really a class but a data structure - it currently has no behaviour. It could be replaced with a String at this stage, however at the very least the label Plane is somewhat intuitive, and as the system grows it is likely to transition from data structure to class as it takes on behaviour.

Originally, I built the system with the assumption that the Plane class would indeed have behaviour (as can be seen in the commit history). However, as the system grew, it became clear that all the data, and therefore the methods that operate on that data should be encapsulated in the relatively cohesive Airport class. The Plane class therefore gradually shed its contents until it became little more than a tag.

The error handling strategy of raising through guard statements is problematic - it breaks the rules of structured programming, making the system harder to reason about. It also requires any client of Airport to wrap calls with error handling blocks. 

There were three alternative strategies I considered:

1. Fail silently - rather than raising an error, methods would simply fail either by returning nothing (nil) or doing nothing at all. However, this would not implement the user stories effectively because it would be unclear to the client what rule had been broken.

2. Add methods that would allow the client to query the Airport before asking to do things - this would allow the responsibility to be moved up the chain to the client, who would be expected to ask if an operation was permissible before doing so. However, given that this is an airport, and lives are at stake, the defensive exception raising behaviour would still need to remain in place. This would therefore add complexity for little clear gain.

3. Create a system whereby clients of the Airport can query it for a list of affordances (using the command pattern) - this would allow the Airport to determine what client's *can* do rather than what they *cannot* do. However, implementing this in a way that would be entirely say (for example, to make sure that clients could not store previously allowable affordances than then reuse them inappropriately) would be a major undertaking and would make no sense in the context of such a tiny little demo


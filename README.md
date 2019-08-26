Airport Management Tool
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

User stories
---------

This tool implements the following user stories

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

Tool should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

Design
---------
2 type of objects:
- Airports, which can land and take off planes, and have varying, random weather states, which can change at each landing/take-off event. Capacity to hold planes limited, per default at 20.
- Planes, which have a state flying or landed

Use
---------

To land and take-off planes:
- use airport = Airport.new(x) to create new airport with capacity 20
- use plane = Plane.new to create new plane. Planes are in "flying" state upon creation (incoming from foreign airspace)
- use airport.land(plane) to land plane at airport
- use airport.takeoff(plane) to take off plane from airport

Detailed design
---------
- Airport has capacity, weather and planes attributes. Planes attributes holds the planes located at airport (via array)
- Weather has 95% probability of being sunny and 5% of being stormy. Weather evolves with each landing/take-off attempt
- Plane has state attribute which defines if plane is "flying" or "landed"
- Ruleset in airport prevents movements during stormy weather and prevents landing if airport full (no recovery)
- Ruleset in plane prevents planes to be in inconsistent state (e.g. land if already landed)

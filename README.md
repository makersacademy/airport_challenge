Airport Challenge
=================
by Toby Hamand

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


Tech/Gems used
---------
* Ruby
* RSpec
* bundler
* rubocop

Instructions
---------

As part of the Makers Academy course, I was set the task to build a system in ruby that meets the needs of the following user stories.
The work was completed alone over one weekend.

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

Method Syntax
---------
- airport1 = Airport.new (is created with 20 passengers waiting to board)
- plane1 = Plane.new (is created in midair and must be landed before boarding)
- plane1.landed? (returns true/false depending on whether the plane is landed)
- airport1.land(plane1)
- airport1.board(plane1)
- airport1.alight(plane1)
- airport1.takeoff(plane1)

(Occasionally bad weather will halt takeoffs and landings)

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

This software simulates the flow of planes at an airport.

The planes can land and take off if the weather is sunny.

Planes can't land or take off if the weather is stormy.

Planes can't land if the runway is full.

Planes must be on a runway before they can take off.

```
--- GETTING STARTED ----

Load 'airport.rb' to begin

```

--- AIRPORT ---

The airport controls the flow of planes.

It grants planes permission to take off and land.

Planes are stored on the RUNWAY

The runway has a default capacity of 20.

To change the capacity use 'Airport.new(X)'.

Methods:

- Airport.new
 - Generates new Airport

- Airport.add_plane(plane)
 - Adds a plane to the runway, unless runway is full.
 - All planes must be on a runway before they can take off.
 - Use add_plane to  add new planes to an airport's runway.

 - Airport.take_off(plane)
   - Allows plane to take off if it is on the runway and weather conditions are clear.

- Airport.land_plane(plane)
  - Lands plane on the runway unless the weather is stormy or the runway is full.

- Airport.weather?
  - Checks that weather conditions are safe enough for take_off and land_plane

- Airport.storm
  - Generates a random number between 1 and 10. Any value above 7 creates a storm.

```

--- PLANE ---

Planes keep track of their status: they can either be on the runway or in the air.

The Airport can ask the plane whether it's flying or not.

Planes must be on a runway before they can take off: use Airport.add_plane to add a plane to an airport's runway.

Methods:

- Plane.new
 - Generates new plane.
 - Use Airport.add_plane to add the plane to an airport's runway.

- Plane.landed
 - Sets the plane's status to on_runway (@flying is false)

- Plane.in_air
 - Sets the plane's status to flying (@flying is true)

- Plane.flying?
 - Returns the status of the plane.
 - True if plane is in the air; false if it's on the runway

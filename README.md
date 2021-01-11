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

Planes can take off if:
 - they are on an airport's runway
 - the weather is sunny
 - they are not in flight

Planes can land if:
 - they are in flight
 - the weather is sunny
 - the airport's runway is not full

```
--- SETTING UP ---

Load 'airport.rb' to begin

Create a new airport, eg:
 - gatwick = Airport.new

Create a new plane, eg
 - makers_airlines = Plane.new

Add the plane to the airport - all planes must begin on a runway.
- gatwick.add_plane(makers_airlines)


```

--- AIRPORT ---

The airport controls the flow of planes.

It grants planes permission to take off and land.

Planes are stored on the RUNWAY

Methods:

- Airport.new(capacity)
 - Generates a new airport.
 - The runway has a default capacity of 20.
 - To set the capacity use 'Airport.new(capacity)'.

- Airport.add_plane(plane)
 - Adds a plane to the runway, unless runway is full.
 - All planes must be on a runway before they can take off.
 - Use add_plane(plane) to add new planes to an airport's runway.
 - A plane can be added only once: a single plane cannot be in more than one airport.

 - Airport.take_off(plane)
   - Allows plane to take off if it is on the runway and weather conditions are clear.

- Airport.land_plane(plane)
  - Lands plane on the runway unless the weather is stormy, the runway is full or the plane is already on a runway.

- Airport.weather?
  - Checks that weather conditions are safe enough for take_off and land_plane

- Airport.storm
  - Generates a random number between 1 and 10. Any value above 7 creates a storm.


--- PLANE ---

Planes keep track of their status: they can either be on a runway or in the air.

The Airport can ask the plane whether it's flying or not.

Planes must be on a runway before they can take off: use Airport.add_plane to add a plane to an airport's runway.

Methods:

- Plane.new
 - Generates new plane.
 - Use Airport.add_plane(plane) to add the plane to an airport's runway.

- Plane.landed
 - Sets the plane's status to on runway (@flying is false)

- Plane.in_air
 - Sets the plane's status to flying (@flying is true)

- Plane.added_to_airport
 - Sets the plane's status to at airport (@at_airport is true)

- Plane.at_airport?
 - Checks if the plane has been added to an airport.
 - Used to prevent a plane from being added to more than one airport.

- Plane.flying?
 - Returns the flight status of the plane.
 - True if plane is in the air; false if it's on the runway.

 ```

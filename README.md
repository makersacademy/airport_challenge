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

This software controls the flow of planes at an airport.

The planes can land and take off if the weather is sunny.

Planes cannot land or take off if the weather is stormy.

1. irb -r 'airport.rb'

Airport - stores planes in the hangar
- Airport.land: adds a plane to the hanger if the aircraft has permission to land

Plane
- Plane.flying?
  - returns TRUE if the Plane is in the sky
- Plane.ask_to_land
  - asks permission to land
